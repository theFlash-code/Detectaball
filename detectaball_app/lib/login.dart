import 'package:flutter/material.dart';

final TextEditingController myController = new TextEditingController();
final TextEditingController myController2 = new TextEditingController();

Widget buildAccount() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Email',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
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
            prefixIcon: Icon(Icons.email, color: Color(0xff274053)),
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.black38),
          ),
        ),
      )
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Password',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
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
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.lock, color: Color(0xff274053)),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildLoginBtn() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      child: const Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: btnEvent,
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff274053),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),

      // padding: EdgeInsets.all,
    ),
  );
}

Widget buildHomePage() {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 120,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
        Container(
          child: Image(image: AssetImage('img/detectaball_logo.png')),
        ),
        buildAccount(),
        buildPassword(),
        buildLoginBtn(),
      ],
    ),
  );
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Detectaball'),
        ),
        body: buildHomePage(),
      ),
    );
  }
}

void btnEvent() {
  print(myController.text);
  print(myController2.text);
}
