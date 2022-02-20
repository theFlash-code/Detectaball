import 'package:flutter/material.dart';

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
              Navigator.pop(context);
            })
      ],
    );
  }

  void btnEvent() {
    print(myController.text);
    print(myController2.text);
    print(myController3.text);
  }
}
