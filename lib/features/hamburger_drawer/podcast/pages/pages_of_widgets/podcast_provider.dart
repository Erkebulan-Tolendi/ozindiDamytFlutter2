import 'package:flutter/material.dart';

class PodcastProvider extends ChangeNotifier {
  List<Map<String, dynamic>> allPodcastList = [];
  List<Map<String, dynamic>> foundCard = [];

  void init(List<Map<String, dynamic>> podcastList) {
    allPodcastList = podcastList;
    foundCard = podcastList;
  }

  List<Map<String, dynamic>> get podcasts => foundCard ?? [];

  void runFilter(String enteredWord) {
    List<Map<String, dynamic>> results = [];
    if (enteredWord.isEmpty) {
      results = allPodcastList;
    } else {
      results = allPodcastList
          .where((Map<String, dynamic> user) =>
              user['name'].toLowerCase().contains(enteredWord.toLowerCase()))
          .toList();
    }
    foundCard = results;
    notifyListeners();
  }

  void sortLan(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.contains("rus")) {
      results = (allPodcastList as List<Map<String, dynamic>>?)
              ?.where((Map<String, dynamic>? user) =>
                  (user?["lang"] as String?)
                      ?.toLowerCase()
                      .contains(enteredKeyword.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else if (enteredKeyword.contains("kaz")) {
      results = (allPodcastList as List<Map<String, dynamic>>?)
              ?.where((Map<String, dynamic>? user) =>
                  (user?["lang"] as String?)
                      ?.toLowerCase()
                      .contains(enteredKeyword.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else {
      results = allPodcastList;
    }

    foundCard = results;
    notifyListeners();
  }
}
