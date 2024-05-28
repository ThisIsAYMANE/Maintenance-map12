import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'my_drawer_header.dart';
import 'Colors.dart';
import 'Services.dart';
import 'EquipmentBrowser.dart';
import 'HelpAndSupport.dart';
import 'Settings.dart';
import 'map.dart';
import 'Calendar.dart';
import 'AdminEquipmentBrowser.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  var currentPage = DrawerSections.dashboard;
  late Widget container;

  @override
  Widget build(BuildContext context) {
    switch (currentPage) {
      case DrawerSections.dashboard:
        container = DashboardPage();
        break;
      case DrawerSections.map:
        container = MapPage();
        break;
      case DrawerSections.Services:
        container = ServicesPage();
        break;
      case DrawerSections.Calendar:
        container = CalendarPage();
        break;
      case DrawerSections.EquipmentBrowser:
        container = EquipmentBrowserPage();
        break;
      case DrawerSections.HelpAndSupport:
        container = HelpAndSupportPage();
        break;
      case DrawerSections.Settings:
        container = SettingsPage();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c1,
        title: Text(
          "MaintenanceMap - Admin",
          style: TextStyle(
            color: AppColors.c4,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: container,
      drawer: Drawer(
        backgroundColor: AppColors.c4,
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.c4,
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 0,
      ),
      child: Column(
        children: [
          menuItem(DrawerSections.dashboard, Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard),
          menuItem(DrawerSections.map, Icons.map,
              currentPage == DrawerSections.map),
          menuItem(DrawerSections.Services, Icons.work,
              currentPage == DrawerSections.Services),
          menuItem(DrawerSections.Calendar, Icons.calendar_month_outlined,
              currentPage == DrawerSections.Calendar),
          menuItem(DrawerSections.EquipmentBrowser, Icons.build,
              currentPage == DrawerSections.EquipmentBrowser),
          Divider(),
          menuItem(DrawerSections.HelpAndSupport, Icons.help_outline,
              currentPage == DrawerSections.HelpAndSupport),
          menuItem(DrawerSections.Settings, Icons.settings,
              currentPage == DrawerSections.Settings),
        ],
      ),
    );
  }

  Widget menuItem(DrawerSections section, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : AppColors.c4,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            currentPage = section;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: selected ? Colors.black : AppColors.c1,
              ),
              SizedBox(width: 16),
              Text(
                section.title,
                style: TextStyle(
                  color: selected ? Colors.black : AppColors.c1,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  map,
  Services,
  EquipmentBrowser,
  HelpAndSupport,
  Settings,
  Calendar,
}

extension DrawerSectionTitle on DrawerSections {
  String get title {
    switch (this) {
      case DrawerSections.dashboard:
        return "Dashboard";
      case DrawerSections.map:
        return "Site Map";
      case DrawerSections.Services:
        return "Services";
      case DrawerSections.EquipmentBrowser:
        return "Equipment Browser";
      case DrawerSections.HelpAndSupport:
        return "Help and Support";
      case DrawerSections.Settings:
        return "Settings";
      case DrawerSections.Calendar:
        return "Calendar";
    }
  }
}
