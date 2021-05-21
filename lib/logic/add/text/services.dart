import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:indulge_me/main.dart';

final addTextUrl = Uri.parse('https://indulge-me.herokuapp.com/indulge/home/');

Future addText(title, story) async {
  final response = await http.post(
    addTextUrl,
    headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader:
          'Token ${Controller().userLocalAuthToken().toString()}',
    },
    body: jsonEncode({
      'title': title,
      'story': story,
      'category': 'Other',
      'tag': ['fun']
    }),
  );
  print(response.statusCode);
  print(response.body);
}
