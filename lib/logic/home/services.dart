import 'package:http/http.dart' as http;
import 'models.dart';
import 'dart:io';
import 'package:indulge_me/main.dart';

final mainUrl = Uri.parse('https://indulge-me.herokuapp.com/indulge/posts.json');

Future<List<Story>> getFirstStories() async {
  final response = await http.get(
    mainUrl,
    headers: {
      HttpHeaders.authorizationHeader:
          'Token ${Controller().userLocalAuthToken().toString()}',
    },
  );

  if (response.statusCode == 200) {
    return storyFromJson(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

Future<List<Story>> getOtherStories(int page) async {
  var _url = 'https://indulge-me.herokuapp.com/indulge/home.json?page=$page';
  var newUrl = Uri.parse(_url);
  final response = await http.get(newUrl);
  if (response.statusCode == 200) {
    return storyFromJson(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}
