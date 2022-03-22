import 'package:flutter/material.dart';
import 'TrainingMatch.dart';

class TrainingRecordPage extends StatelessWidget {
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
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(159, 191, 195, 202)),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            title: Text(
              'September 10, 2000',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.linear_scale,
                    color: Color.fromARGB(255, 236, 177, 26)),
                Icon(Icons.linear_scale,
                    color: Color.fromARGB(255, 236, 177, 26)),
                Text(" 21:17")
              ],
            ),
            leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(right: new BorderSide(width: 1.0))),
                child: Icon(Icons.sports_tennis)),
            trailing: IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            onTap: () {},
            onLongPress: () {},
            dense: true,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(159, 191, 195, 202)),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            title: Text(
              'September 10, 2000',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.linear_scale,
                    color: Color.fromARGB(255, 236, 177, 26)),
                Icon(Icons.linear_scale,
                    color: Color.fromARGB(255, 236, 177, 26)),
                Text(" 21:17")
              ],
            ),
            leading: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: new BoxDecoration(
                    border: new Border(right: new BorderSide(width: 1.0))),
                child: Icon(Icons.sports_tennis)),
            trailing: IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            onTap: () {},
            onLongPress: () {},
            dense: true,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(159, 191, 195, 202)),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            title: Text(
              'September 10, 2000',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.linear_scale,
                    color: Color.fromARGB(255, 236, 177, 26)),
                Icon(Icons.linear_scale,
                    color: Color.fromARGB(255, 236, 177, 26)),
                Text(" 21:17")
              ],
            ),
            leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(right: new BorderSide(width: 1.0))),
                child: Icon(Icons.sports_tennis)),
            trailing: IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            onTap: () {},
            onLongPress: () {},
            dense: true,
          ),
        )
      ]),
    );
  }
}
