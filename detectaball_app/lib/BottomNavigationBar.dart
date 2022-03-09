import 'package:flutter/material.dart';
import 'pages/PracticeMatch.dart';
import 'pages/RefereeMatch.dart';
import 'pages/Profile.dart';

class BottomNavigationController extends StatefulWidget {
  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  int _currentIndex = 0;
  final pages = [profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        shadowColor: Colors.blueGrey,
        backgroundColor: Color.fromARGB(255, 81, 94, 104),
        title: const Text('Practice'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 81, 94, 104),
          selectedItemColor: Colors.yellow[700],
          unselectedItemColor: Colors.grey,
          currentIndex: index,
          onTap: (int idx) {
            setState(() {
              index = idx;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                //color: Colors.blueGrey,
              ),
              label: ('Practice'),
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
              label: ('Record'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
                //color: Colors.blueGrey,
              ),
              label: ('Profile'),
            ),
          ]),
      body: buildPracticeMatchPage(context),
    );
  }
}
