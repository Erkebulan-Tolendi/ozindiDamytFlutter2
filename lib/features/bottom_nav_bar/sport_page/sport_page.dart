import 'package:flutter/material.dart';

class SportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home Page'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Кітап оқу'),
            subtitle: Text('бет'),
          ),
          ListTile(
            leading: Icon(Icons.quiz),
            title: Text('Quiz'),
            subtitle: Text('балл'),
          ),
          ListTile(
            leading: Icon(Icons.sports),
            title: Text('Спорт'),
            subtitle: Text('мин'),
          ),
        ],
      ),
    );
  }
}
