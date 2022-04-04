import 'package:detectaball_app/start.dart';

import 'register.dart';
import 'pages/TrainingMatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BottomNavigationBar.dart';

final TextEditingController myController = new TextEditingController();
final TextEditingController myController2 = new TextEditingController();

Widget buildEmail() {
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

Widget buildLoginBtn(context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      child: const Text(
        'LOGIN',
        style: TextStyle(
          color: Color(0xff274053),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationController()),
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

Widget build_Forget_Password(context) {
  return GestureDetector(
    onTap: () => print('forget password.'),
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Forget Password? ',
          style: TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.underline,
            //fontSize: 18,
          )),
      TextSpan(
          text: '',
          style: TextStyle(
            color: Colors.grey,
            //fontSize: 18,
            //fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ))
    ])),
  );
}

Widget build_Register(context) {
  return GestureDetector(
    onTap: () {
      print('Register');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => registerPage()),
      );
    },
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(
            color: Colors.grey,
            //fontSize: 18,
          )),
      TextSpan(
          text: 'Sign Up',
          style: TextStyle(
            color: Colors.grey,
            //fontSize: 18,
            //fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ))
    ])),
  );
}

Widget build_Skip_loginBtn(context) {
  return GestureDetector(
    onTap: () {
      print('skip login');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationController()),
      );
    },
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '',
          style: TextStyle(
            color: Colors.grey,
            //fontSize: 18,
          )),
      TextSpan(
          text: 'skip login',
          style: TextStyle(
            color: Colors.grey,
            //fontSize: 18,
            //fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ))
    ])),
  );
}

Widget buildLoginPage(context) {
  return Scaffold(
    body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 225, 230, 243),
                    Color.fromARGB(255, 119, 130, 156),
                    Color.fromARGB(255, 85, 96, 122),
                    Color.fromARGB(255, 49, 57, 75),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child:
                          Image(image: AssetImage('img/detectaball_logo.png')),
                    ),
                    SizedBox(height: 10),
                    buildEmail(),
                    SizedBox(height: 10),
                    buildPassword(),
                    SizedBox(height: 20),
                    buildLoginBtn(context),
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

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                child: Image(
                  image: AssetImage('img/icon(white).png'),
                  //scale: 2.0,
                  fit: BoxFit.fill,
                ),
                width: 150.0,
                height: 105.0,
              ),
            ),
            // Center(
            //   child: Text(
            //     'Login',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 40,
            //         fontWeight: FontWeight.w500),
            //   ),
            // ),
            // SizedBox(
            //   height: 3,
            // ),
            // Center(
            //   child: Text(
            //     'Welcome to Detectabll',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
            SizedBox(height: 5),
          ]),
    );
  }
}

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color.fromRGBO(58, 66, 86, 1.0),
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              'Welcome to Detectaball',
              style: TextStyle(
                color: Color.fromRGBO(58, 66, 86, 1.0),
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildEmail(),
          SizedBox(height: 10),
          buildPassword(),
          SizedBox(height: 20),
          build_Forget_Password(context),
          SizedBox(height: 7),
          build_Register(context),
          // Text(
          //   'Forget Password?',
          //   style: TextStyle(color: Colors.grey),
          // ),
          SizedBox(height: 30),
          buildLoginBtn(context),
          build_Skip_loginBtn(context)
        ],
      ),
    );
  }
}

class LP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color.fromARGB(255, 49, 57, 75),
            Color.fromARGB(255, 49, 57, 75),
            Color.fromARGB(255, 49, 57, 75),
            Color.fromARGB(255, 49, 57, 75),
          ]),
        ),
        child: Column(children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Header(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: InputWrapper(),
            ),
          )
        ]),
      ),
    );
  }
}

class LoginPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LP(),
    );
  }
}

void btnEvent() {
  print(myController.text);
  print(myController2.text);
}
