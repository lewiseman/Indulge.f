import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:indulge_me/main.dart';

final url = Uri.parse('https://indulge-me.herokuapp.com/auth/users/me');

Future<List> getDetails() async {
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader:
          'Token ${Controller().userLocalAuthToken().toString()}',
    },
  );
  if (response.statusCode == 200) {
    final data = convert.jsonDecode(response.body);
    List details = [data['email'], data['username']];
    return details;
  }
  return ['null', 'null'];
}

// class UserDetails {
//   String email
// }