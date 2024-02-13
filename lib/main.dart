import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/bottom_navigation/bottom_navigation.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/library/pages/add_book.dart';

void main() {
  runApp(const MyApp()
      // ChangeNotifierProvider(
      //   create: (context) => BookAccess(),
      //   child: MyApp(),
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/add_book': (context) => AddBook(),
        '/Podacst': (context) => AddBook(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNavBar(),
    );
  }
}
