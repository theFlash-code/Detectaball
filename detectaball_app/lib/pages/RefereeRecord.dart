import 'package:flutter/material.dart';
import 'TrainingMatch.dart';

// class RefereeRecordList {
//   String id;
//   String title;
//   // String LUser;
//   // String RUser;
//   DateTime date;

//   RefereeRecordList({
//     @required this.id,
//     @required this.title,
//     // @required this.LUser,
//     // @required this.RUser,
//     @required this.date,
//   });
// }

// class RefereeRecordListPage extends StatelessWidget {
// RefereeRecordListPage({Key key}) : super(key: key);

// final List<RefereeRecordList> refereerecordList = [
// RefereeRecordList(
// id: '1',
// title: 'Table',
// // LUser = 'Sherry',
// // RUser = 'May',
// date: DateTime.now(),
// ),
// RefereeRecordList(
// id: '2',
// title: 'Tennis',
// // LUser = 'Alan',
// // RUser = 'Tom',
// date: DateTime.now(),
// ),
// ];

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