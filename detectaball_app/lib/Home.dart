import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      home: Top(),
      //home: MyHomePage(),
    );
  }
}

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          onPressed: () {},
        ),
        title: const Image(
          image: AssetImage('img/detectaball_logo.png'),
          height: 100,
          width: 200,
        ),
        centerTitle: true,
        backgroundColor: Colors.white60,
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Referee",
      "Practice",
      "Profile",
    ];

    final List<Widget> images = [
      GestureDetector(
        onTap: () {
          print("Tapped a Contain");
        },
        child: Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('img/scoreboard.png'),
              //   //fit: BoxFit.fill,
              // ),
              color: Colors.yellow[700],
              borderRadius: BorderRadius.circular(15)),
          //color: Colors.yellow[700],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {},
                  align: ALIGN.CENTER,
                  onSelectedItem: (index) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
