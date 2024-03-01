import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/my_header_drawer.dart';
import 'package:ozindi_damyt/routing/app_roures.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => DrawerMenuState();
}

class DrawerMenuState extends State<DrawerMenu> {
  var currentPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 235,
      child: ListView(
        children: [
          MyHeaderDrawer(),
          const SizedBox(
            height: 13,
          ),
          MyDrawerList()
        ],
      ),
    );
  }

  @override
  Widget MyDrawerList() {
    return Column(
      children: [
        menuItem(
            1,
            "Кітапхана",
            "library.png",
            currentPage == DrawerSections.library ? true : false,
            AppRoutes.libraryPage),
        sb2(),
        menuItem(
            2,
            "Ғибратты әңгімелер",
            "stoury.png",
            currentPage == DrawerSections.stoury ? true : false,
            AppRoutes.stouryPage),
        sb2(),
        menuItem(
            3,
            "Подкаст",
            "podcast.png",
            currentPage == DrawerSections.podcast ? true : false,
            AppRoutes.podcastPage),
        sb2(),
        menuItem(
            4,
            "Quiziz",
            "quiz.png",
            currentPage == DrawerSections.quiz ? true : false,
            AppRoutes.quizPage),
        sb2(),
        menuItem(
            5,
            "Марафон",
            "marathon.png",
            currentPage == DrawerSections.marathon ? true : false,
            AppRoutes.maraphonePage),
        sb2(),
        menuItem(
            6,
            "Профориентация",
            "proforintation.png",
            currentPage == DrawerSections.proforintation ? true : false,
            AppRoutes.proforintationPage),
        sb2(),
        menuItem(
            7,
            "Хобби",
            "hobby.png",
            currentPage == DrawerSections.hobby ? true : false,
            AppRoutes.hobbyPage),
        sb2(),
        menuItem(
            8,
            "Спорт",
            "sport.png",
            currentPage == DrawerSections.sport ? true : false,
            AppRoutes.sportPage),
        sb2(),
        menuItem(
            9,
            "Кино",
            "movies.png",
            currentPage == DrawerSections.cinema ? true : false,
            AppRoutes.cinemaPage),
        sb2(),
        menuItem(
          10,
          "Жаңа ұсыныстар",
          "new_recommendation.png",
          currentPage == DrawerSections.new_recommendation ? true : false,
          AppRoutes.newRecommendationPage,
        ),
        sb2(),
      ],
    );
  }

  Widget menuItem(
      int id, String title, String icon, bool selected, String namePage) {
    return Material(
      color: selected ? Colors.red[200] : Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(
            () {
              if (id == 1) {
                currentPage = DrawerSections.library;
              } else if (id == 2) {
                currentPage = DrawerSections.stoury;
              } else if (id == 3) {
                currentPage = DrawerSections.podcast;
              } else if (id == 4) {
                currentPage = DrawerSections.quiz;
              } else if (id == 5) {
                currentPage = DrawerSections.marathon;
              } else if (id == 6) {
                currentPage = DrawerSections.proforintation;
              } else if (id == 7) {
                currentPage = DrawerSections.hobby;
              } else if (id == 8) {
                currentPage = DrawerSections.sport;
              } else if (id == 9) {
                currentPage = DrawerSections.cinema;
              } else if (id == 10) {
                currentPage = DrawerSections.new_recommendation;
              }
            },
          );
          Navigator.of(context).pop();
          Navigator.pushNamed(context, namePage);
        },
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Image(
                image: AssetImage('assets/icons/$icon'),
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

SizedBox sb2() {
  return const SizedBox(
    height: (2.4),
  );
}

enum DrawerSections {
  cinema,
  hobby,
  library,
  marathon,
  new_recommendation,
  podcast,
  proforintation,
  quiz,
  sport,
  stoury
}
