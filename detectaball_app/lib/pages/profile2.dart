import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        shadowColor: Colors.blueGrey,
        backgroundColor: Color.fromARGB(255, 81, 94, 104),
        title: Text('Profile'),
      ),
      body: ListView(
        children: List.generate(15, (idx) {
          return Card(
            child: Container(
              height: 150,
              color: Color.fromARGB(255, 230, 230, 230),
              child: Text('$idx'),
            ),
          );
        }),
      ),
    );
  }
}
