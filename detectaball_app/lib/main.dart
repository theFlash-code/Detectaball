import 'package:flutter/material.dart';
import 'Bpage.dart';
import 'start.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: start(),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   final TextEditingController myController = new TextEditingController();
//   final TextEditingController myController2 = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         TextField(
//           controller: myController,
//           decoration: InputDecoration(hintText: '帳號'),
//         ),
//         TextField(
//           controller: myController2,
//           decoration: InputDecoration(hintText: '密碼'),
//         ),
//         ElevatedButton(
//           child: Text('登入'),
//           onPressed: btnEvent,
//           style: ElevatedButton.styleFrom(
//             primary: Colors.orange,
//           ),
//         ),
//         ElevatedButton(
//           child: Text('註冊'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => BPage(),
//               ),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             primary: Colors.orange,
//           ),
//         )
//       ],
//     );
//   }

//   void btnEvent() {
//     print(myController.text);
//     print(myController2.text);
//   }
// }
