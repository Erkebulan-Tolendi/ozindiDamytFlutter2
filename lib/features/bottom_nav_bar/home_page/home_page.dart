import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

List<Map<String, dynamic>> user_info = [
  {
    "name": "Кітап оқу",
    "type_info": "бет",
    "info": "843",
    "photo": "assets/icons/book_icon.png",
  },
  {
    "name": "Quiz",
    "type_info": "балл",
    "info": "280",
    "photo": "assets/icons/question-mark.png",
  },
  {
    "name": "Спорт",
    "type_info": "мин",
    "info": "152",
    "photo": "assets/icons/biceps.png",
  },
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
              )
            ],
          ),
          child: AppBar(
            flexibleSpace: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "User Name",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "user@example.com",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('URL_OF_USER_PHOTO'),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: ListAction(),
    );
  }
}

class ListAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 280,
          child: ListInfo(),
        )
      ],
    );
  }
}

class ListInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: user_info.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: EdgeInsets.all(8),
            height: 70,
            child: CardKino(
              index: index,
            ),
          ),
        );
      },
    );
  }
}

class CardKino extends StatelessWidget {
  int index;
  CardKino({required this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Image.asset(
          user_info[index]["photo"],
          width: 35,
          height: 35,
        ),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          child: SizedBox(
              width: 120,
              child: Text(
                user_info[index]["name"],
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: Row(
            children: [
              Text(
                user_info[index]["info"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                user_info[index]["type_info"],
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
