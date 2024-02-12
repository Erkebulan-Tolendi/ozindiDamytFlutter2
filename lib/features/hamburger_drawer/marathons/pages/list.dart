import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/hobby/pages/loadingpage.dart';

List<Map<String, dynamic>> marathone = [
  {
    "id": 1,
    "name_mara": "451*",
    "type_mara": "Кітап- алтын қазына",
    "date": "22.01- 1.02",
    "gift": "Меломан дүкендер желісінен кітап",
    "photo": "assets/images/marathones/451.jpg",
  },
];

class MaraphoneListWidget extends StatefulWidget {
  const MaraphoneListWidget({Key? key}) : super(key: key);

  @override
  MaraphoneListWidgetState createState() => MaraphoneListWidgetState();
}

class MaraphoneListWidgetState extends State<MaraphoneListWidget> {
  bool _loading = false;

  void _toggleLoading(bool value) {
    setState(() {
      _loading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? LoadingPage(
            onStopLoading: () {
              _toggleLoading(false);
            },
          )
        : Expanded(
            child: ListView.builder(
              itemCount: marathone.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ChannelList(hobby: hobby[index]),
                    //   ),
                    // );
                  },
                  key: ValueKey(marathone[index]["id"]),
                  child: Stack(
                    children: [
                      Container(
                        width: 400,
                        height: 130,
                        child: Image.asset(marathone[index]["photo"],
                            fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              marathone[index]["name_mara"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.blueGrey),
                            ),
                            Text(
                              marathone[index]["type_mara"],
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.blueGrey),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  marathone[index]["date"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.card_giftcard_rounded,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  marathone[index]["gift"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.blueGrey),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Icon(
                                  Icons.telegram,
                                  color: Colors.blueGrey,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
