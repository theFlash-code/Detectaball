// import 'package:detectaball_app/start.dart';
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
        backgroundColor: Colors.blueGrey,
        title: Text('Profile'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            width: 600,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.grey),
            child: Text(
              '\nUser name : $name\n\nEmail : $email',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text('\n'),
          Container(
            height: 200,
            width: 600,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.grey),
            child: Text(
              '\nGame Record :',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text('\n'),
          Container(
            height: 200,
            width: 600,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.grey),
            child: Text(
              '\nPractice Record :',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ElevatedButton(
            child: const Text(
              'Log Out',
              style: TextStyle(
                color: Color(0xff274053),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => start()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          )
        ],
      ),
    );
  }
}
// Text(
//   'User name： $name',
//   style: TextStyle(
//       color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
// ),
// Text('Email: $email'),
