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
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          title: Text(
            'September 10, 2000',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: Colors.yellow[700]),
              Text(" 21:17")
            ],
          ),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(right: new BorderSide(width: 1.0))),
              child: Icon(Icons.sports_score)),
          trailing: Icon(Icons.videocam),
          onTap: () {},
          onLongPress: () {},
          dense: true,
        )
      ]),
    );
  }
}
