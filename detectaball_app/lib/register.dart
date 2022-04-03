import 'package:detectaball_app/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'pages/profile.dart';

final TextEditingController myController3 = new TextEditingController();
final TextEditingController myController4 = new TextEditingController();
Widget buildUserName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'User Name',
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
          controller: myController3,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(Icons.person, color: Color(0xff274053)),
            hintText: 'User Name',
            hintStyle: TextStyle(color: Colors.black38),
          ),
        ),
      )
    ],
  );
}

Widget buildConfirmPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Confirm Password',
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
          controller: myController4,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.black87,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon:
                Icon(Icons.lock_outline_rounded, color: Color(0xff274053)),
            hintText: 'Confirm Password',
            hintStyle: TextStyle(color: Colors.black38),
          ),
        ),
      )
    ],
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
          MaterialPageRoute(
              builder: (context) =>
                  profile(name: myController3.text, email: myController.text)),
        );
        print('sign up');
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow[700],
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}

class registerPage extends StatelessWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white60,
        title: const Image(
          image: AssetImage('img/detectaball_logo.png'),
          height: 100,
          width: 200,
        ),
      ),
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
                      Color.fromRGBO(58, 66, 86, 1.0),
                      Color.fromRGBO(58, 66, 86, 1.0),
                      Color.fromRGBO(58, 66, 86, 1.0),
                      Color.fromRGBO(58, 66, 86, 1.0),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 60,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          // child: const Image(
                          //     //image: AssetImage('img/detectaball_logo.png')
                          //     ),
                          ),
                      const SizedBox(height: 50),
                      buildUserName(),
                      const SizedBox(height: 10),
                      buildEmail(),
                      const SizedBox(height: 10),
                      buildPassword(),
                      const SizedBox(height: 10),
                      buildConfirmPassword(),
                      const SizedBox(height: 50),
                      buildRegisterBtn(context)
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
