import 'package:flutter/material.dart';
import 'package:ozindi_damyt/features/hamburger_drawer/podcast/pages/pages_of_widgets/podcast_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AllPodcast extends StatefulWidget {
  final Map<String, dynamic> item;
  const AllPodcast({Key? key, required this.item}) : super(key: key);

  @override
  State<AllPodcast> createState() => _AllPodcastState();
}

class _AllPodcastState extends State<AllPodcast> {
  List<Map<String, dynamic>> foundCard = [];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> podcasts = widget.item['podcasts'];

    final podProvider = Provider.of<PodcastProvider>(context, listen: false);
    podProvider.init(podcasts);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Барлығын көру',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.filter_alt_sharp, color: Colors.black),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("RUS"),
                value: "RUS",
                onTap: () {
                  podProvider.sortLan("rus");
                },
              ),
              PopupMenuItem(
                child: Text("KAZ"),
                value: "KAZ",
                onTap: () {
                  podProvider.sortLan("kaz");
                },
              ),
              PopupMenuItem(
                child: Text("ALL"),
                value: "ALL",
                onTap: () {
                  podProvider.sortLan("all");
                },
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: TextField(
                    onChanged: (String value) => podProvider.runFilter(value),
                    decoration: InputDecoration(
                      hintText: 'Іздеу',
                      labelStyle: TextStyle(
                          color: Colors.black12, fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search,
                          color: Colors.black87, size: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Consumer<PodcastProvider>(
                  builder: (context, data, child) {
                    final podList = data.podcasts;
                    print('Pod List: $podList');
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        mainAxisExtent: 210,
                      ),
                      itemCount: podList.length,
                      itemBuilder: (_, index) {
                        final podcast = podList[index];
                        return GestureDetector(
                          onTap: () async {
                            final url = Uri.parse(podcast["url"]);
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                  child: Image.asset(
                                    podcast['photo'],
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        podcast['name'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          ImageIcon(
                                            AssetImage(podcast['logo']),
                                            size: 20,
                                            color: Colors.amber,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            podcast['subtitle'],
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade800,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            podcast['lang'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
