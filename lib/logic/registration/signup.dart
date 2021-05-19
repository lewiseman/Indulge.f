import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indulge_me/logic/registration/login.dart';

final signupUrl = Uri.parse('https://indulge-me.herokuapp.com/auth/users/');

Future signupUser(email, username, password) async {
  final response = await http.post(
    signupUrl,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(
        {"email": email, "username": username, "password": password}),
  );
  print(response.body);
  final responseJson = jsonDecode(response.body);

  if (response.statusCode == 201) {
    //SignUp userData = SignUp.fromJson(responseJson);
    loginUser(username, password);
    return 2;
  } else if (response.statusCode == 400) {
    print(responseJson);
    return 3;
  } else {
    print(responseJson);
    return 4;
  }
}

class SignUp {
  String email;
  String username;
  int id;
  SignUp({this.email, this.username, this.id});

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(
      email: json['email'],
      username: json['username'],
      id: json['id'],
    );
  }
}
