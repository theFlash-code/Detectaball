import 'package:detectaball_app/start.dart';
import 'package:flutter/material.dart';
// import 'package:url_lan'

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 30,
            ),SizedBox(
              width: 320,
              child: Text(
                ' Detectaball is a school project made by 4 university student.',
                style: TextStyle(
                  color: Color(0xff274053),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 30,
            ),SizedBox(
              width: 320,
              child: Text(
                ' We aim for making a mobile app to be used as an intelligent scoreboard, so that the player will no longer be frustrated when they forgot what\'s the score.',
                style: TextStyle(
                  color: Color(0xff274053),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 30,
            ),SizedBox(
              width: 320,
              child: Text(
                ' In addition, we want to provide an analytic system to let the user know their strengths and weaknesses, thereby allowing them to improve their performance.',
                style: TextStyle(
                  color: Color(0xff274053),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
             SizedBox(
              width: double.infinity,
              height: 30,
            ),SizedBox(
              width: 320,
              child: Text(
                'If you are interested in our project, please visit:\nhttps://github.com/theFlash-code/Detectaball',
                style: TextStyle(
                  color: Color(0xff274053),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 10,
            ),
            SizedBox(
              height: 72,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  //backgroundColor: Color.fromARGB(159, 222, 224, 228),
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'https://github.com/theFlash-code/Detectaball',
                      style: TextStyle(
                        color: Color(0xff274053),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 45),
                    Expanded(
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

class About_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('About us'),
      ),
      body: Body(),
    );
  }
}
