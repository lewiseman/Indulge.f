import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:indulge_me/main.dart';

Future<List<StorySearch>> searchData(data) async {
  final searchUrl =
      Uri.parse('https://indulge-me.herokuapp.com/indulge/posts?search=$data');
  final response = await http.get(
    searchUrl,
    headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader:
          'Token ${Controller().userLocalAuthToken().toString()}',
    },
  );
  var jsonData = convert.jsonDecode(response.body);
  var jsonBody = jsonData['results'];
  return List<StorySearch>.from(
      jsonBody.map((dynamic body) => StorySearch.fromJson(body)));
}

class StorySearch {
  String owner;
  String title;
  String date;
  String story;
  String category;
  String tags;
  int viewers;

  StorySearch({
    this.owner,
    this.title,
    this.date,
    this.story,
    this.category,
    this.tags,
    this.viewers,
  });

  factory StorySearch.fromJson(Map<String, dynamic> json) => StorySearch(
        owner: json['owner_username'],
        title: json['title'],
        date: json['date'],
        story: json['story'],
        category: json['category'],
        tags: json['tags'],
        viewers: json['viewers'],
      );
}
