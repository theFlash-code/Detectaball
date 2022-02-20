import 'package:flutter/material.dart';
import 'register.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detectaball'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController myController = new TextEditingController();
  final TextEditingController myController2 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: myController,
          decoration: InputDecoration(hintText: '帳號(電子郵件)'),
        ),
        TextField(
          controller: myController2,
          decoration: InputDecoration(hintText: '密碼'),
        ),
        ElevatedButton(
          child: Text('登入'),
          onPressed: btnEvent,
        ),
        ElevatedButton(
          child: Text('註冊'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BPage()));
          },
        )
      ],
    );
  }

  void btnEvent() {
    print(myController.text);
    print(myController2.text);
  }
}
