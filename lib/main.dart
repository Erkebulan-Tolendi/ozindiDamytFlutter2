import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/bottom_nav_bar/home_page/home_page.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/library/models/book_access.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/library/pages/add_book.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookAccess(),
      child: MyApp(),
    ),
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
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
