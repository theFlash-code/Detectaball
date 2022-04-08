import 'package:detectaball_app/start.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
            ),
            SizedBox(
              child: Text(
                'Please contact us by Email.',
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
                onPressed: () async {
                  final toEmail = 'wasw0523@gmail.com';
                  final subject = '\(Feedback for Detectabll app\)';
                  final message = '';
                  final url =
                      'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Row(
                  children: [
                    Text(
                      'Email ',
                      style: TextStyle(
                        color: Color(0xff274053),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 45),
                    Expanded(
                      child: Text(
                        'wasw0523@gmail.com',
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

class Helper_center extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Helper Center'),
      ),
      body: Body(),
    );
  }
}