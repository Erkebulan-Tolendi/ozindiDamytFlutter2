import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/proforintation/pages/loadingpage.dart';

List<Map<String, dynamic>> hobby = [
  {
    "id": 1,
    "photo": "assets/images/hobby/img.png",
    "name": "Домбыра үйрену",
    "url": "UCyTeUcItLiosZvtHHOFAKLQ"
  },
  {
    "id": 2,
    "photo": "assets/images/hobby/img_1.png",
    "name": "Тәтті пісіру",
    "url": "UCzWAedCZRs02RxuEzX7bzDw"
  },
  {
    "id": 3,
    "photo": "assets/images/hobby/img_3.png",
    "name": "Фотошоп уйрену",
    "url": "UCkacKUAoMrtllypQ3yAsjIQ"
  },
  {
    "id": 4,
    "photo": "assets/images/hobby/img_2.png",
    "name": "Шахмат үйрену",
    "url": "UCqR09MTvuIYcQVDupvv6Wxw"
  },
  {
    "id": 5,
    "photo": "assets/images/hobby/img_4.png",
    "name": "Ағылшын үйрену",
    "url": "UC_3oKG5Szq-m6Xz-MjRZgpw"
  }
];

class ProListWidget extends StatefulWidget {
  const ProListWidget({Key? key}) : super(key: key);

  @override
  _ProListWidgetState createState() => _ProListWidgetState();
}

class _ProListWidgetState extends State<ProListWidget> {
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
              itemCount: hobby.length,
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
                  key: ValueKey(hobby[index]["id"]),
                  child: Stack(
                    children: [
                      Container(
                        child: Image.asset(hobby[index]["photo"],
                            fit: BoxFit.fill),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          hobby[index]["name"],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
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