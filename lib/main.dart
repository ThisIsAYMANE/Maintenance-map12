import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Calendar.dart';
import 'Colors.dart';
import 'EquipmentBrowser.dart';
import 'HelpAndSupport.dart';
import 'Services.dart';
import 'Settings.dart';
import 'dashboard.dart';
import 'login.dart';
import 'admin_home.dart';  // Admin-specific home page
import 'map.dart';
import 'my_drawer_header.dart';
import 'user_home.dart';  // User-specific home page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBeMOpjVyI2m9D30pZuLU-UhVBLbV1JHMM", // paste your api key here
      appId: "1:814894887732:android:b2b560bc929eb22646ab61", //paste your app id here
      projectId: "my-project-flutter-maps-423307",
      messagingSenderId: '814894887732', //paste your project id here
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthGate(),
        '/homePage': (context) => UserHomePage(),
        '/adminHomePage': (context) => AdminHomePage(),
      },
    );
  }
}

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasData) {
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users_ocp')
                .doc(snapshot.data!.uid)
                .get(),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (userSnapshot.hasData) {
                var userRole = userSnapshot.data!['role'];
                if (userRole == 'admin') {
                  return AdminHomePage();
                } else {
                  return UserHomePage();
                }
              }
              return LoginPage();
            },
          );
        }
        return LoginPage();
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          "MaintenanceMap",
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
