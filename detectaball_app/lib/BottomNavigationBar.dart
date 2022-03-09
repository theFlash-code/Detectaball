import 'package:flutter/material.dart';
import 'pages/TrainingMatch.dart';
import 'pages/RefereeMatch.dart';
import 'pages/profile2.dart';
import 'pages/profileScreen.dart';
import 'pages/Record.dart';

class BottomNavigationController extends StatefulWidget {
  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  int _currentIndex = 0;
  final pages = [
    TrainingMatchPage(),
    RefereePage(),
    RecordPage(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 81, 94, 104),
          selectedItemColor: Colors.yellow[700],
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (int idx) {
            setState(() {
              _currentIndex = idx;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                //color: Colors.blueGrey,
              ),
              label: ('Training'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.record_voice_over,
                //color: Colors.blueGrey,
              ),
              label: ('Referee'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                // color: Colors.blueGrey,
              ),
              label: ('History'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
                //color: Colors.blueGrey,
              ),
              label: ('Profile'),
            ),
          ]),
    );
  }
}
