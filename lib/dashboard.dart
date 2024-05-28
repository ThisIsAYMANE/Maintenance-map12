import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart'; // Import AppColors class
import 'package:intl/intl.dart';
import 'Classes.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of items for the grid
    List<Items> myList = [item1, item2, item3, item4];
    var color = AppColors.c2;
    return Scaffold(
      backgroundColor: color,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          // Header section
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16), // Add top padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Dashboard title
                      Text(
                        "Dashboard",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      // Username
                      Text(
                        "username",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: AppColors.c3,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Notification icon
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          // Grid View for items
          Expanded(
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: myList.map((data) {
                return GestureDetector(
                  onTap: () {
                    // Define what happens when the container is tapped
                    if (data.title == "Calendar") {
                      // Navigate to CalendarPage, for example
                    } else if (data.title == "Equipment Overview") {
                      // Action for Equipment Overview item
                      print('Container tapped: Equipment Overview');
                      // Navigate to EquipmentOverviewPage, for example
                    } else if (data.title == "Reports & Analytics") {
                      // Action for Reports & Analytics item
                      print('Container tapped: Reports & Analytics');
                      // Navigate to ReportsAnalyticsPage, for example
                    } else if (data.title == "Maintenance Tasks") {
                      // Action for Maintenance Tasks item
                      print('Container tapped: Maintenance Tasks');
                      // Navigate to MaintenanceTasksPage, for example
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.c4,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Icon
                        Icon(
                          data.icon,
                          size: 42,
                          color: AppColors.c1,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        // Title
                        Text(
                          data.title,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        // Subtitle
                        Text(
                          data.subtitle,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: AppColors.c2,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        // Event
                        Text(
                          data.event,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Model class for items


// Sample items
Items item1 = new Items(
  title: "Calendar",
  subtitle: DateFormat.yMMMMEEEEd().format(DateTime.now()), // Format the current date
  event: "   ", // 3 Events",
  icon: Icons.calendar_today,
);

Items item2 = new Items(
  title: "Equipment Overview",
  subtitle: "PC, Laptop,...",
  event: "4 Items",
  icon: Icons.storage,
);

Items item3 = new Items(
  title: "Reports & Analytics",
  subtitle: "Site1,Site2,...",
  event: "WIFI down",
  icon: Icons.analytics,
);

Items item4 = new Items(
  title: "Maintenance Tasks",
  subtitle: "Fixing the WIFI",
  event: "",
  icon: Icons.apps,
);

