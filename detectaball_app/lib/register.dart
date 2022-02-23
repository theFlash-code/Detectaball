import 'package:detectaball_app/profile.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('註冊'),
      ),
      body: _BPage(),
    );
  }
}

class _BPage extends StatelessWidget {
  final TextEditingController myController = new TextEditingController();
  final TextEditingController myController2 = new TextEditingController();
  final TextEditingController myController3 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: myController,
          decoration: InputDecoration(hintText: '使用者名稱'),
        ),
        TextField(
          controller: myController2,
          decoration: InputDecoration(hintText: '帳號(電子郵件)'),
        ),
        TextField(
          controller: myController3,
          decoration: InputDecoration(hintText: '密碼'),
        ),
        ElevatedButton(
          child: Text('註冊'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => profile(
                      name: myController.text, email: myController2.text)),
            );
          },
        )
      ],
    );
  }

  void btnEvent() {
    print(myController.text);
    print(myController2.text);
    print(myController3.text);
  }
}
// body: Container(
//      color: Colors.grey,
//         child: Text(
//           'User name： $name',
//           style: TextStyle(
//               fontSize: 50.0, color: Colors.grey, fontStyle: FontStyle.italic),
//         ),
//       ),
// Text(
//   'User name： $name',
//   style: TextStyle(
//       color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
// ),
// Text('Email: $email'),
// ElevatedButton(
//   child: const Text(
//     'Log Out',
//     style: TextStyle(
//       color: Color(0xff274053),
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => start()),
//     );
//   },
//   style: ElevatedButton.styleFrom(
//     primary: Colors.white,
//     padding: const EdgeInsets.all(15),
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15)),
//   ),
// )