import 'package:flutter/material.dart';
import 'Colors.dart';
class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.c1,
      width: double.infinity,
      height: 120,
      padding: EdgeInsets.only(top: 35.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            "username",
            style: TextStyle(color: AppColors.c3, fontSize: 20),
          ),
          Text(
            "usenam's email",
            style: TextStyle(
              color: AppColors.c4,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}