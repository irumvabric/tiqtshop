import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tiqtshop/main.dart';
import 'package:tiqtshop/screens/Home.dart';

void signUp(String username, String first_name, String last_name, String email,
    String password, String gender) async {
  var dio = Dio();
  final ctx = navigatorKey.currentContext as BuildContext;

  try {
    final response = await dio.post(
      'https://api.tiqtshop.kubwacu.com/users',
      data: {
        'username': username,
        'first_name': username,
        'last_name': username,
        'email': email,
        'password': password,
        'gender': gender,
      },
    );

    if (response.statusCode == 202) {
      print('Sign up successful');
      Navigator.pushNamed(ctx, "/screens/Home");
    } else {
      print('Failed to sign up');
      // Handle failure
    }
  } on DioError catch (e) {
    print('Error: ${e.response?.statusCode}, ${e.message}');
    // Handle error
  }
}
