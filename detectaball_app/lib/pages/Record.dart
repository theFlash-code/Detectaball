import 'package:flutter/material.dart';
import 'TrainingRecord.dart';
import 'RefereeRecord.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            foregroundColor: Colors.white,
            shadowColor: Colors.blueGrey,
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            title: Text('Your History'),
            bottom: TabBar(tabs: [Tab(text: 'Training'), Tab(text: 'Referee')]),
          ),
          body: TabBarView(
            children: [TrainingRecordPage(), RefereeRecordPage()],
          )),
    );
  }
}
