import 'package:detectaball_app/pages/profile_body.dart';
import 'package:flutter/material.dart';
import 'profile_body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Profile'),
      ),
      body: Body(),
    );
  }
}
