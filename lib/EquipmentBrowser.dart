import 'package:flutter/material.dart';
import 'Classes.dart';



// Define EquipmentInstances class to hold equipment instances


class EquipmentInstances {
  static List<Equipment> equipmentInstances = [
    Equipment(
      equipmentID: '001',
      name: 'Printer',
      type: 'Printer',
      brand: 'HP',
      model: 'LaserJet Pro MFP M130fw',
      serialNumber: 'SN123456',
      location: 'Office Room',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 4, 15),
      nextMaintenanceDate: DateTime(2023, 10, 15),
      purchaseDate: DateTime(2022, 1, 20),
      purchaseCost: 399.99,
      notes: 'Black and white laser printer',
      icon: Icons.print, // Provide the related icon
    ),
    Equipment(
      equipmentID: '002',
      name: 'Laptop',
      type: 'Laptop',
      brand: 'Dell',
      model: 'XPS 15',
      serialNumber: 'SN789012',
      location: 'Home Office',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 6, 20),
      nextMaintenanceDate: DateTime(2023, 12, 20),
      purchaseDate: DateTime(2023, 1, 10),
      purchaseCost: 1499.99,
      notes: 'High-performance laptop for productivity',
      icon: Icons.laptop, // Provide the related icon
    ),
    Equipment(
      equipmentID: '003',
      name: 'Desktop Computer',
      type: 'Desktop',
      brand: 'Apple',
      model: 'iMac 27-inch',
      serialNumber: 'SN456789',
      location: 'Living Room',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 5, 10),
      nextMaintenanceDate: DateTime(2023, 11, 10),
      purchaseDate: DateTime(2022, 3, 5),
      purchaseCost: 1999.99,
      notes: 'All-in-one desktop computer',
      icon: Icons.desktop_windows, // Provide the related icon
    ),
    Equipment(
      equipmentID: '004',
      name: 'Projector',
      type: 'Projector',
      brand: 'Epson',
      model: 'PowerLite 1781W',
      serialNumber: 'SN234567',
      location: 'Conference Room',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 7, 25),
      nextMaintenanceDate: DateTime(2023, 1, 25),
      purchaseDate: DateTime(2021, 12, 15),
      purchaseCost: 699.99,
      notes: 'Wireless portable projector',
      icon: Icons.ondemand_video, // Provide the related icon
    ),
    Equipment(
      equipmentID: '005',
      name: 'Scanner',
      type: 'Scanner',
      brand: 'Canon',
      model: 'imageFORMULA R40',
      serialNumber: 'SN345678',
      location: 'Office Room',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 8, 12),
      nextMaintenanceDate: DateTime(2023, 2, 12),
      purchaseDate: DateTime(2022, 2, 28),
      purchaseCost: 249.99,
      notes: 'High-speed document scanner',
      icon: Icons.scanner, // Provide the related icon
    ),
    Equipment(
      equipmentID: '006',
      name: 'Monitor',
      type: 'Monitor',
      brand: 'Samsung',
      model: 'U32J590',
      serialNumber: 'SN456789',
      location: 'Home Office',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 9, 18),
      nextMaintenanceDate: DateTime(2023, 3, 18),
      purchaseDate: DateTime(2023, 4, 30),
      purchaseCost: 349.99,
      notes: '32-inch 4K UHD monitor',
      icon: Icons.monitor, // Provide the related icon
    ),
    Equipment(
      equipmentID: '007',
      name: 'Desk Chair',
      type: 'Furniture',
      brand: 'Herman Miller',
      model: 'Aeron Chair',
      serialNumber: 'SN567890',
      location: 'Home Office',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 10, 5),
      nextMaintenanceDate: DateTime(2023, 4, 5),
      purchaseDate: DateTime(2020, 8, 20),
      purchaseCost: 1399.99,
      notes: 'Ergonomic office chair',
      icon: Icons.chair, // Provide the related icon
    ),
    Equipment(
      equipmentID: '008',
      name: 'Keyboard',
      type: 'Peripherals',
      brand: 'Logitech',
      model: 'G Pro X',
      serialNumber: 'SN678901',
      location: 'Office Room',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 11, 30),
      nextMaintenanceDate: DateTime(2023, 5, 30),
      purchaseDate: DateTime(2021, 10, 10),
      purchaseCost: 129.99,
      notes: 'Mechanical gaming keyboard',
      icon: Icons.keyboard, // Provide the related icon
    ),
    Equipment(
      equipmentID: '009',
      name: 'Mouse',
      type: 'Peripherals',
      brand: 'Razer',
      model: 'DeathAdder Elite',
      serialNumber: 'SN789012',
      location: 'Home Office',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 12, 20),
      nextMaintenanceDate: DateTime(2023, 6, 20),
      purchaseDate: DateTime(2020, 7, 15),
      purchaseCost: 69.99,
      notes: 'Gaming mouse with customizable buttons',
      icon: Icons.mouse, // Provide the related icon
    ),
    Equipment(
      equipmentID: '010',
      name: 'Desk',
      type: 'Furniture',
      brand: 'IKEA',
      model: 'LINNMON / ALEX',
      serialNumber: 'SN890123',
      location: 'Home Office',
      status: 'Active',
      lastMaintenanceDate: DateTime(2023, 1, 10),
      nextMaintenanceDate: DateTime(2023, 7, 10),
      purchaseDate: DateTime(2019, 5, 20),
      purchaseCost: 199.99,
      notes: 'Simple and functional desk',
      icon: Icons.desk, // Provide the related icon
    ),
    // Add more instances as needed
  ];
}


// Define EquipmentBrowserPage to display all equipment types



class EquipmentBrowserPage extends StatelessWidget {
  // Helper function to map equipment types to icons
  IconData getIconForType(String type) {
    switch (type) {
      case 'Printer':
        return Icons.print;
      case 'Laptop':
        return Icons.laptop;
      case 'Desktop':
        return Icons.desktop_windows;
      case 'Router':
        return Icons.router;
      case 'Switch':
        return Icons.switch_camera; // Not a perfect icon, but usable
      case 'Server':
        return Icons.dns;
      case 'Chair':
        return Icons.chair;
      case 'Monitor':
        return Icons.monitor;
      case 'Keyboard':
        return Icons.keyboard;
      case 'Mouse':
        return Icons.mouse;
      case 'Rack':
        return Icons.storage;
      case 'UPS':
        return Icons.battery_charging_full; // Represents UPS
      case 'Firewall':
        return Icons.security;
      case 'Access Point':
        return Icons.wifi;
      default:
        return Icons.devices;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract all unique equipment types
    Set<String> equipmentTypes = Set<String>();
    for (var equipment in EquipmentInstances.equipmentInstances) {
      equipmentTypes.add(equipment.type);
    }

    // Calculate the height in pixels for 2 centimeters
    final double heightInPixels = 2 * MediaQuery.of(context).devicePixelRatio * 11.0;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: equipmentTypes.length,
          itemBuilder: (context, index) {
            final type = equipmentTypes.elementAt(index);
            final IconData iconData = getIconForType(type);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to EquipmentTypeDetailsPage with the selected type
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EquipmentTypeDetailsPage(equipmentType: type),
                    ),
                  );
                },
                child: SizedBox(
                  height: heightInPixels, // Set the height in pixels
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(iconData), // Use the corresponding icon
                      title: Text(
                        type,
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class EquipmentTypeDetailsPage extends StatelessWidget {
  final String equipmentType;

  EquipmentTypeDetailsPage({required this.equipmentType});

  @override
  Widget build(BuildContext context) {
    // Filter instances based on the selected type
    final filteredInstances =
    EquipmentInstances.equipmentInstances.where((instance) => instance.type == equipmentType).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$equipmentType',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold), // Larger and bold title
        ),
      ),
      body: ListView.builder(
        itemCount: filteredInstances.length,
        itemBuilder: (context, index) {
          final instance = filteredInstances[index];
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  instance.name,
                  style: TextStyle(fontSize: 20.0), // Larger font size for title
                ),
                subtitle: Text(
                  instance.location,
                  style: TextStyle(fontSize: 16.0), // Slightly larger font size for subtitle
                ),
                onTap: () {
                  // Navigate to EquipmentDetailsPage with the selected equipment
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EquipmentDetailsPage(equipment: instance),
                    ),
                  );
                },
              ),
              Divider(), // Add a divider after each ListTile
            ],
          );
        },
      ),
    );
  }
}


// Define EquipmentDetailsPage to display equipment details
class EquipmentDetailsPage extends StatelessWidget {
  final Equipment equipment;

  EquipmentDetailsPage({required this.equipment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${equipment.name} Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${equipment.name}'),
            Text('Type: ${equipment.type}'),
            Text('Brand: ${equipment.brand}'),
            Text('Model: ${equipment.model}'),
            Text('Serial Number: ${equipment.serialNumber}'),
            Text('Location: ${equipment.location}'),
            Text('Status: ${equipment.status}'),
            Text('Last Maintenance Date: ${equipment.lastMaintenanceDate.toString()}'),
            Text('Next Maintenance Date: ${equipment.nextMaintenanceDate.toString()}'),
            Text('Purchase Date: ${equipment.purchaseDate.toString()}'),
            Text('Purchase Cost: ${equipment.purchaseCost.toString()}'),
            Text('Notes: ${equipment.notes}'),
          ],
        ),
      ),
    );
  }
}


