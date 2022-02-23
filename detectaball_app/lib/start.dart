import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'register.dart';
import 'login.dart';
import 'profile.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  _startState createState() => _startState();
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
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}

Widget buildRegisterBtn(context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15),
    width: double.infinity,
    child: ElevatedButton(
      child: const Text(
        'Sign Up',
        style: TextStyle(
          color: Color(0xff274053),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
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
                      Color(0x66274053),
                      Color(0x77274053),
                      Color(0xbb274053),
                      Color(0xff274053),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 180,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: const Image(
                          image: AssetImage("img/detectaball_icon.png"),
                        ),
                      ),
                      Container(
                        child: const Image(
                          image: AssetImage("img/detectaball_word.png"),
                        ),
                      ),
                      // const Text(
                      //   'Detectaball',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 40,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      const SizedBox(height: 10),
                      buildLoginBtn(context),
                      buildRegisterBtn(context),
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
}
