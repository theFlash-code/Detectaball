// import 'dart:js';
import '../Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final TextEditingController myController = new TextEditingController();
final TextEditingController myController2 = new TextEditingController();

Widget buildLeftUser() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      // const Text(
      //   'Left User',
      //   style: TextStyle(
      //       color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      // ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(100, 0, 0, 0),
                  blurRadius: 6,
                  offset: Offset(0, 2)),
            ]),
        height: 60,
        child: TextField(
          controller: myController,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(Icons.switch_right, color: Color(0xff274053)),
            hintText: 'Left User',
            hintStyle: TextStyle(color: Colors.black38),
          ),
        ),
      )
    ],
  );
}

Widget buildRightUser() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      // const Text(
      //   'Password',
      //   style: TextStyle(
      //       color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      // ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(100, 0, 0, 0),
                  blurRadius: 6,
                  offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          controller: myController2,
          obscureText: true,
          style: const TextStyle(
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.switch_left, color: Color(0xff274053)),
              hintText: 'Right User',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildMatchBtn(context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      child: const Text(
        'ADD MATCH',
        style: TextStyle(
          color: Color(0xff274053),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow[700],
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),

      // padding: EdgeInsets.all,
    ),
  );
}

Widget buildPracticeMatchPage(context) {
  return Scaffold(
    body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Color.fromARGB(148, 255, 255, 255),
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [
              //       Color(0x11274053),
              //       Color(0x55274053),
              //       Color(0xbb274053),
              //       Color(0xff274053),
              //     ],
              //   ),
              // ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image(image: AssetImage('img/ball.png')),
                    ),
                    SizedBox(height: 10),
                    buildLeftUser(),
                    SizedBox(height: 10),
                    buildRightUser(),
                    SizedBox(height: 10),
                    buildMatchBtn(context),
                    // TextField(
                    //   controller: myController,
                    //   decoration: InputDecoration(hintText: 'Account'),
                    // ),
                    // TextField(
                    //   controller: myController2,
                    //   decoration: InputDecoration(hintText: 'Password'),
                    // ),
                    // ElevatedButton(
                    //   child: Text('登入'),
                    // onPressed: btnEvent,
                    // style: ElevatedButton.styleFrom(
                    //   primary: Colors.orange,
                    // ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class MatchPage extends StatefulWidget {
  @override
  _MatchPageState createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  int index = 0;

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

// class MatchPage extends StatelessWidget {
//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         shadowColor: Colors.blueGrey,
//         backgroundColor: Color.fromARGB(255, 81, 94, 104),
//         title: const Text('Practice'),
//       ),
//       body: buildLoginPage(context),
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Color.fromARGB(255, 81, 94, 104),
//           selectedItemColor: Colors.yellow[700],
//           unselectedItemColor: Colors.grey,
//           currentIndex: index,
//           onTap: (int idx) {
//             index = idx;
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.add,
//                 //color: Colors.blueGrey,
//               ),
//               label: ('Practice'),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.record_voice_over,
//                 //color: Colors.blueGrey,
//               ),
//               label: ('Referee'),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.calendar_today,
//                 // color: Colors.blueGrey,
//               ),
//               label: ('Record'),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.account_box,
//                 //color: Colors.blueGrey,
//               ),
//               label: ('Profile'),
//             ),
//           ]),
//     );
//   }
// }

void btnEvent() {
  print(myController.text);
  print(myController2.text);
}
