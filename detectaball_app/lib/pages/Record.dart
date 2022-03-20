import 'package:flutter/material.dart';

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
            backgroundColor: Color.fromARGB(255, 81, 94, 104),
            title: Text('Your History'),
            bottom: TabBar(tabs: [Tab(text: 'Training'), Tab(text: 'Referee')]),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Training')),
              Center(child: Text('Referee'))
            ],
          )),
    );
  }
}
