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
<<<<<<< Updated upstream
      body: ListView(
        children: List.generate(15, (idx) {
          return Card(
            child: Container(
              height: 150,
              color: Color.fromARGB(255, 230, 230, 230),
              child: Text('$idx'),
            ),
          );
        }),
      ),
=======
      body: ListView(children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-2, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(214, 255, 255, 255)),
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
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-2, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(214, 255, 255, 255)),
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
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-2, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(214, 255, 255, 255)),
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
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-2, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(214, 255, 255, 255)),
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
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-2, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(214, 255, 255, 255)),
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
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-2, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(214, 255, 255, 255)),
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
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-2, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(214, 255, 255, 255)),
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
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(-2, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(214, 255, 255, 255)),
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
>>>>>>> Stashed changes
    );
  }
}
