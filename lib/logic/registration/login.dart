import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indulge_me/main.dart';

final loginUrl =
    Uri.parse('https://indulge-me.herokuapp.com/authenticate/token/login/');

Future loginUser(username, password) async {
  final response = await http.post(
    loginUrl,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'username': username,
      'password': password,
    }),
  );
  final responseJson = jsonDecode(response.body);
  if (response.statusCode == 200) {
    LoginAuth token = LoginAuth.fromJson(responseJson);
    Controller().addAuth(token.authToken);
    return 2;
  } else if (response.statusCode == 400) {
    return 3;
  }
  return 4;
}

class LoginAuth {
  String authToken;
  LoginAuth({this.authToken});

  factory LoginAuth.fromJson(Map<String, dynamic> json) {
    return LoginAuth(authToken: json['auth_token']);
  }
}
