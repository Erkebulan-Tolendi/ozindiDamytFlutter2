import 'package:flutter/material.dart';

class MyBookPage extends StatelessWidget {
  const MyBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Book Page"),
      ),
      body: Center(
        child: Text("My Book Page"),
      ),
    );
  }
}
