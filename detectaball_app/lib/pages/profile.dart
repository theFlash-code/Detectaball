import 'package:detectaball_app/start.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  String name;
  String email;

  profile({Key? key, required this.name, required this.email})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
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
