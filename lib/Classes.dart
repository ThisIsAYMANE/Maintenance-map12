import 'package:flutter/material.dart';


class Equipment {
  String equipmentID;
  String name;
  String type;
  String brand;
  String model;
  String serialNumber;
  String location;
  String status;
  DateTime lastMaintenanceDate;
  DateTime nextMaintenanceDate;
  DateTime purchaseDate;
  double purchaseCost;
  String notes;
  IconData icon; // New property for icon

  Equipment({
    required this.equipmentID,
    required this.name,
    required this.type,
    required this.brand,
    required this.model,
    required this.serialNumber,
    required this.location,
    required this.status,
    required this.lastMaintenanceDate,
    required this.nextMaintenanceDate,
    required this.purchaseDate,
    required this.purchaseCost,
    required this.notes,
    required this.icon, // Initialize icon property
  });
}


class Items {
  String title;
  String subtitle;
  String event;
  IconData icon;
  Items({
    required this.title,
    required this.subtitle,
    required this.event,
    required this.icon,
  });
}

class MaintenanceTasks {
  String taskID;
  String equipmentID;
  String description;
  String technicianID;
  String status;
  DateTime scheduledDateTime;
  DateTime completionDateTime;

  MaintenanceTasks({
    required this.taskID,
    required this.equipmentID,
    required this.description,
    required this.technicianID,
    required this.status,
    required this.scheduledDateTime,
    required this.completionDateTime,
  });
}

class ReportsAndAnalysis {
  String reportID;
  String title;
  String description;
  List<Equipment> equipmentID;
  DateTime createdAt;
  DateTime lastUpdatedAt;

  ReportsAndAnalysis({
    required this.reportID,
    required this.title,
    required this.description,
    required this.equipmentID,
    required this.createdAt,
    required this.lastUpdatedAt,
  });
}


class Services {
  String SiteID;
  String title;
  String subtitle;
  String location;
  List<Equipment> equipmentList = [];
  List<MaintenanceTasks> maintenanceTasksList = [];
  String manager;
  String contactInfo;

  IconData icon;
  Services({
    required this.SiteID,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.equipmentList,
    required this.maintenanceTasksList,
    required this.manager,
    required this.contactInfo,
    required this.icon,
  });
}

