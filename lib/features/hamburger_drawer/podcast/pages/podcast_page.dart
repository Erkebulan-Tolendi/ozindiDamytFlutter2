import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/podcast/pages/pages_of_widgets/all_widgets_page.dart';

class PodcastPage extends StatelessWidget {
  const PodcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Podcast Page'),
        ),
        body: AllWidgetsPage(),
      ),
    );
  }
}
