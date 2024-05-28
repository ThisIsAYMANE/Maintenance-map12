import 'package:flutter/material.dart';
import 'Classes.dart';
import 'package:flutter_project1/EquipmentBrowser.dart';

class AdminEquipmentBrowserPage extends StatelessWidget {
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
                      builder: (context) => AdminEquipmentTypeDetailsPage(equipmentType: type),
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

class AdminEquipmentTypeDetailsPage extends StatefulWidget {
  final String equipmentType;

  AdminEquipmentTypeDetailsPage({required this.equipmentType});

  @override
  _AdminEquipmentTypeDetailsPageState createState() => _AdminEquipmentTypeDetailsPageState();
}

class _AdminEquipmentTypeDetailsPageState extends State<AdminEquipmentTypeDetailsPage> {
  void _deleteEquipment(BuildContext context, Equipment equipment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Equipment'),
          content: Text('Are you sure you want to delete this equipment?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  EquipmentInstances.equipmentInstances.remove(equipment);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addEquipment(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _brandController = TextEditingController();
    final TextEditingController _modelController = TextEditingController();
    final TextEditingController _serialNumberController = TextEditingController();
    final TextEditingController _locationController = TextEditingController();
    final TextEditingController _statusController = TextEditingController();
    final TextEditingController _lastMaintenanceDateController = TextEditingController();
    final TextEditingController _nextMaintenanceDateController = TextEditingController();
    final TextEditingController _purchaseDateController = TextEditingController();
    final TextEditingController _purchaseCostController = TextEditingController();
    final TextEditingController _notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Equipment'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _brandController,
                    decoration: InputDecoration(labelText: 'Brand'),
                  ),
                  TextFormField(
                    controller: _modelController,
                    decoration: InputDecoration(labelText: 'Model'),
                  ),
                  TextFormField(
                    controller: _serialNumberController,
                    decoration: InputDecoration(labelText: 'Serial Number'),
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(labelText: 'Location'),
                  ),
                  TextFormField(
                    controller: _statusController,
                    decoration: InputDecoration(labelText: 'Status'),
                  ),
                  TextFormField(
                    controller: _lastMaintenanceDateController,
                    decoration: InputDecoration(labelText: 'Last Maintenance Date'),
                  ),
                  TextFormField(
                    controller: _nextMaintenanceDateController,
                    decoration: InputDecoration(labelText: 'Next Maintenance Date'),
                  ),
                  TextFormField(
                    controller: _purchaseDateController,
                    decoration: InputDecoration(labelText: 'Purchase Date'),
                  ),
                  TextFormField(
                    controller: _purchaseCostController,
                    decoration: InputDecoration(labelText: 'Purchase Cost'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: _notesController,
                    decoration: InputDecoration(labelText: 'Notes'),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newEquipment = Equipment(
                    equipmentID: UniqueKey().toString(),
                    name: _nameController.text,
                    type: widget.equipmentType, // Locked to the type
                    brand: _brandController.text,
                    model: _modelController.text,
                    serialNumber: _serialNumberController.text,
                    location: _locationController.text,
                    status: _statusController.text,
                    lastMaintenanceDate: DateTime.tryParse(_lastMaintenanceDateController.text) ?? DateTime.now(),
                    nextMaintenanceDate: DateTime.tryParse(_nextMaintenanceDateController.text) ?? DateTime.now(),
                    purchaseDate: DateTime.tryParse(_purchaseDateController.text) ?? DateTime.now(),
                    purchaseCost: double.tryParse(_purchaseCostController.text) ?? 0.0,
                    notes: _notesController.text,
                    icon: Icons.device_unknown, // Example icon, change as needed
                  );
                  setState(() {
                    EquipmentInstances.equipmentInstances.add(newEquipment);
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter instances based on the selected type
    final filteredInstances = EquipmentInstances.equipmentInstances.where((instance) => instance.type == widget.equipmentType).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.equipmentType}',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold), // Larger and bold title
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addEquipment(context),
          ),
        ],
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
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteEquipment(context, instance),
                ),
                onTap: () {
                  // Navigate to AdminEquipmentDetailsPage with the selected equipment
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminEquipmentDetailsPage(equipment: instance),
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


class AdminEquipmentDetailsPage extends StatefulWidget {
  final Equipment equipment;

  AdminEquipmentDetailsPage({required this.equipment});

  @override
  _AdminEquipmentDetailsPageState createState() => _AdminEquipmentDetailsPageState();
}

class _AdminEquipmentDetailsPageState extends State<AdminEquipmentDetailsPage> {
  void _editField(String title, String currentValue, Function(String) onSave) {
    final TextEditingController controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: title),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                onSave(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.equipment.name} Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEditableField('Name', widget.equipment.name, (value) {
              setState(() {
                widget.equipment.name = value;
              });
            }),
            _buildEditableField('Type', widget.equipment.type, (value) {
              setState(() {
                widget.equipment.type = value;
              });
            }),
            _buildEditableField('Brand', widget.equipment.brand, (value) {
              setState(() {
                widget.equipment.brand = value;
              });
            }),
            _buildEditableField('Model', widget.equipment.model, (value) {
              setState(() {
                widget.equipment.model = value;
              });
            }),
            _buildEditableField('Serial Number', widget.equipment.serialNumber, (value) {
              setState(() {
                widget.equipment.serialNumber = value;
              });
            }),
            _buildEditableField('Location', widget.equipment.location, (value) {
              setState(() {
                widget.equipment.location = value;
              });
            }),
            _buildEditableField('Status', widget.equipment.status, (value) {
              setState(() {
                widget.equipment.status = value;
              });
            }),
            _buildEditableField('Last Maintenance Date', widget.equipment.lastMaintenanceDate.toString(), (value) {
              setState(() {
                widget.equipment.lastMaintenanceDate = DateTime.parse(value);
              });
            }),
            _buildEditableField('Next Maintenance Date', widget.equipment.nextMaintenanceDate.toString(), (value) {
              setState(() {
                widget.equipment.nextMaintenanceDate = DateTime.parse(value);
              });
            }),
            _buildEditableField('Purchase Date', widget.equipment.purchaseDate.toString(), (value) {
              setState(() {
                widget.equipment.purchaseDate = DateTime.parse(value);
              });
            }),
            _buildEditableField('Purchase Cost', widget.equipment.purchaseCost.toString(), (value) {
              setState(() {
                widget.equipment.purchaseCost = double.parse(value);
              });
            }),
            _buildEditableField('Notes', widget.equipment.notes, (value) {
              setState(() {
                widget.equipment.notes = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(String title, String value, Function(String) onSave) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$title: $value'),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            _editField(title, value, onSave);
          },
        ),
      ],
    );
  }
}

