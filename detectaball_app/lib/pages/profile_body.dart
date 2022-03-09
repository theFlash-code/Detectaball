import 'package:flutter/material.dart';

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
              height: 115,
              width: 115,
              child: CircleAvatar(
                backgroundImage: AssetImage('img/user.png'),
                backgroundColor: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 190,
              width: 350,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(bottom: 50, left: 30),
                  //primary: Colors.white,
                  backgroundColor: Color.fromARGB(159, 222, 224, 228),
                  //onSurface: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 30),
                    Expanded(
                      child: Text(
                        'Training',
                        style: TextStyle(
                          color: Color(0xff274053),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Referee',
                        style: TextStyle(
                          color: Color(0xff274053),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 72,
              width: 350,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  //primary: Colors.white,
                  backgroundColor: Color.fromARGB(159, 222, 224, 228),
                  //onSurface: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.share, color: Colors.blueGrey),
                    SizedBox(width: 30),
                    Expanded(
                      child: Text(
                        'About us',
                        style: TextStyle(
                          color: Color(0xff274053),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              width: 350,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  //primary: Colors.white,
                  backgroundColor: Color.fromARGB(159, 222, 224, 228),
                  //onSurface: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.help_center, color: Colors.blueGrey),
                    SizedBox(width: 30),
                    Expanded(
                      child: Text(
                        'Helper Center',
                        style: TextStyle(
                          color: Color(0xff274053),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              width: 350,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  //primary: Colors.white,
                  backgroundColor: Color.fromARGB(159, 138, 139, 143),
                  //onSurface: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    //Icon(Icons.share, color: Colors.blueGrey),
                    SizedBox(width: 100),
                    Expanded(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Color(0xff274053),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.logout,
                      color: Color(0xff274053),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
