import 'package:detectaball_app/start.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('個人檔案'),
      ),
      body: _profile(),
    );
  }
}

class _profile extends StatelessWidget {
  final TextEditingController myController = new TextEditingController();
  final TextEditingController myController2 = new TextEditingController();
  final TextEditingController myController3 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Name',
          textDirection: TextDirection.ltr,
        ),
        Text(
          'Email',
          textDirection: TextDirection.ltr,
        ),
        Text(
          'Game Record',
          textDirection: TextDirection.ltr,
        ),
        Text(
          'Practice Record',
          textDirection: TextDirection.ltr,
        ),
        ElevatedButton(
          child: Text('LOGOUT'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => start()),
            );
          },
        )
      ],
    );
  }
}
