import 'package:flutter/material.dart';
import 'Services.dart'; // Importing Services.dart file where Services class is defined
import 'Colors.dart';
import 'Classes.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

class ServiceDetailsPage extends StatelessWidget {
  final Services service;

  const ServiceDetailsPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c1,
        title: Text(
          service.title,
          style: TextStyle(
            fontSize: 24, // Increase font size
            fontWeight: FontWeight.bold, // Bold text
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16), // Add some space at the top
            _buildInfoRowWithDivider('Subtitle:', service.subtitle),
            _buildInfoRowWithDivider('Location:', service.location),
            _buildInfoRowWithDivider('SiteID:', service.SiteID),
            _buildInfoRowWithDivider('Manager:', service.manager),
            _buildInfoRowWithDivider('Contact Info:', service.contactInfo),
            // Display other properties as needed
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRowWithDivider(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(label, value),
        Divider(), // Add a divider after each row
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lato( // Use Google Fonts for improved styling
            fontSize: 18, // Increase font size
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
        SizedBox(height: 4), // Add some vertical space between label and value
        Text(
          value,
          style: GoogleFonts.lato(fontSize: 16), // Use Google Fonts for improved styling
        ),
      ],
    );
  }
}
