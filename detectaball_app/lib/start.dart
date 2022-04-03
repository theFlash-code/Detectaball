import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Bpage.dart';
import 'login.dart';
import 'logintest.dart';
import 'register.dart';
import 'Home.dart';
import 'widget/custom_page_route.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  _startState createState() => _startState();
}

Widget buildLoginBtn(context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    width: 300,
    child: ElevatedButton(
      child: const Text(
        'START',
        style: TextStyle(
          color: Color(0xff274053),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        print('start');
        Navigator.of(context).push(
          CustomPageRoute(
            child: LoginPage2(),
            direction: AxisDirection.up,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow[700],
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}

Widget buildRegisterBtn(context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    width: 300,
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
          MaterialPageRoute(builder: (context) => registerPage()),
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/start2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                // decoration: const BoxDecoration(
                //   gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [
                //       Color.fromARGB(255, 225, 230, 243),
                //       Color.fromARGB(255, 119, 130, 156),
                //       Color.fromARGB(255, 85, 96, 122),
                //       Color.fromARGB(255, 49, 57, 75),
                //     ],
                //   ),
                // ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 180,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: AssetImage('img/icon(white).png'),
                          //scale: 2.0,
                          fit: BoxFit.fill,
                        ),
                        width: 210.0,
                        height: 147.0,
                      ),
                      // Container(
                      //   child: const Image(
                      //     image: AssetImage("img/icon(white).png"),
                      //   ),
                      // ),
                      Container(
                        child: const Image(
                          image: AssetImage("img/word(white).png"),
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
                      const SizedBox(height: 70),
                      buildLoginBtn(context),
                      const SizedBox(height: 17),
                      buildRegisterBtn(context),
                      const SizedBox(height: 10),
                      Text(
                        'Skip Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
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
