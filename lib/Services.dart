import 'package:flutter/material.dart';
import 'Classes.dart';
import 'ServiceDetails.dart';
import 'Colors.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package


// Define the Services class

// Creating instances of Services for testing outside any class
Services service1 = Services(
  SiteID: '001',
  title: 'Service 1',
  subtitle: 'Subtitle 1',
  location: 'Location 1',
  equipmentList: [], // Add equipment list if needed
  maintenanceTasksList: [], // Add maintenance tasks list if needed
  manager: 'Manager 1',
  contactInfo: 'Contact Info 1',
  icon: Icons.ac_unit, // Add the icon
);

Services service2 = Services(
  SiteID: '002',
  title: 'Service 2',
  subtitle: 'Subtitle 2',
  location: 'Location 2',
  equipmentList: [], // Add equipment list if needed
  maintenanceTasksList: [], // Add maintenance tasks list if needed
  manager: 'Manager 2',
  contactInfo: 'Contact Info 2',
  icon: Icons.access_alarm, // Add the icon
);

// Define servicesList outside any class
List<Services> servicesList = [service1, service2]; // Initialize the list with your services

class ServicesPage extends StatelessWidget {
  ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: servicesList.length,
          itemBuilder: (context, index) {
            final service = servicesList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetailsPage(service: service),
                    ),
                  );
                },
                child: Card(
                  color: AppColors.c4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      service.title,
                      style: GoogleFonts.lato( // Use Google Fonts
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'ID: ${service.SiteID}',
                              style: GoogleFonts.lato( // Use Google Fonts
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Location: ${service.location}',
                          style: GoogleFonts.lato( // Use Google Fonts
                            fontSize: 14.0,
                          ),
                        ),
                      ],
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