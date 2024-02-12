import 'package:flutter/material.dart';
import 'package:ozindi_damyt/core/navigation/navigation.dart';

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
            centerTitle: true, // Center the title in the appBar
          ),
        ),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
