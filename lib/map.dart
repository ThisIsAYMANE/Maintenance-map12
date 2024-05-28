import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  static const LatLng _ocpSafiLocation = LatLng(32.23206594460836, -9.252726664210162);
  Map<PolylineId, Polyline> polylines = {};
  BitmapDescriptor? _currentLocationIcon;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCurrentLocationIcon();
    _fetchPolylinePoints().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _ocpSafiLocation, zoom: 16),
            mapType: MapType.satellite,
            polylines: Set<Polyline>.of(polylines.values),
            markers: {
              Marker(
                markerId: MarkerId("_currentLocation"),
                icon: _currentLocationIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                position: _ocpSafiLocation,
              ),
            },
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(), // Show loader while map is loading
            ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  void _loadCurrentLocationIcon() async {
    _currentLocationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/current_location_icon.png',
    );
  }

  Future<void> _fetchPolylinePoints() async {
    try {
      List<LatLng> polylineCoordinates = [];
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBeMOpjVyI2m9D30pZuLU-UhVBLbV1JHMM",
        PointLatLng(_ocpSafiLocation.latitude, _ocpSafiLocation.longitude),
        PointLatLng(_ocpSafiLocation.latitude, _ocpSafiLocation.longitude),
        travelMode: TravelMode.driving,
      );
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
        _generatePolyline(polylineCoordinates);
      } else {
        print(result.errorMessage);
      }
    } catch (e) {
      print("Error fetching polyline points: $e");
    }
  }

  void _generatePolyline(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.black,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }
}
