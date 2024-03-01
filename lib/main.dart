import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/bottom_navigation/bottom_navigation.dart';
import 'package:ozindi_damyt/features/bottom_nav_bar/sport_page/sport_page.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/cinema/cinema_page.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/hobby/hobby_page.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/library/library_page.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/library/pages/add_book.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/marathons/marathon.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/podcast/pages/podcast_page.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/proforintation/proforintation_page.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/quiz/quiz_page.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/stoury/stoury_page.dart';
import 'package:ozindi_damyt/routing/app_roures.dart';
import 'package:provider/provider.dart';

import 'features/hamburger_drawer/new_recommendation/new_recommendation_page.dart';
import 'features/hamburger_drawer/podcast/pages/pages_of_widgets/all_podcasts.dart';
import 'features/hamburger_drawer/podcast/pages/pages_of_widgets/podcast_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the 'podcasts' key
    final Map<String, dynamic> sampleData = {
      'podcasts': [
        // Your podcast data here
      ]
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.libraryPage: (context) => LibraryPage(),
        AppRoutes.stouryPage: (context) => StouryPage(),
        AppRoutes.podcastPage: (context) => PodcastPage(),
        AppRoutes.quizPage: (context) => QuizPage(),
        AppRoutes.maraphonePage: (context) => MaraphonePage(),
        AppRoutes.proforintationPage: (context) => ProforintationPage(),
        AppRoutes.hobbyPage: (context) => HobbyPage(),
        AppRoutes.sportPage: (context) => SportPage(),
        AppRoutes.cinemaPage: (context) => CinemaPage(),
        AppRoutes.newRecommendationPage: (context) => NewRecommendationPage(),
        '/add_book': (context) => AddBook(),
        '/allPodcast': (context) => AllPodcast(item: sampleData),
        AppRoutes.podcasts: (context) => ChangeNotifierProvider(
              create: (context) => PodcastProvider(),
              child: AllPodcast(item: sampleData),
            ),
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
