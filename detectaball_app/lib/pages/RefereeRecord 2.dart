import 'package:flutter/material.dart';
import 'TrainingMatch.dart';

class RefereeRecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   foregroundColor: Colors.white,
      //   shadowColor: Colors.blueGrey,
      //   backgroundColor: Color.fromARGB(255, 81, 94, 104),
      //   title: Text('Your History'),
      // ),
      body: ListView(children: [
        ListTile(
          title: Text('September 10, 2000'),
          subtitle: Text('Demo subtitle'),
          leading: Icon(Icons.sports_tennis),
          trailing: Icon(Icons.videocam),
          onTap: () {},
          onLongPress: () {},
          dense: true,
        )
      ]),
    );
  }
}
