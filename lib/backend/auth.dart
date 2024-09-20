import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tiqtshop/main.dart';
import 'package:tiqtshop/screens/Home.dart';

class AuthService {
  late Dio _dio;
  final String _baseUrl = 'https://api.tiqtshop.kubwacu.com';
  final ctx = navigatorKey.currentContext as BuildContext;

  AuthService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      validateStatus: (status) {
        return status! < 500; // Accept all status codes less than 500
      },
    ));
  }

  Future<void> authenticateUser(String email, String password) async {
    try {
      final response = await _dio.post(
        '/users/auth',
        data: {
          'identifier': email,
          'password': password,
        },
      );

      if (response.statusCode == 202) {
        Navigator.pushNamed(ctx, "/screens/Home");
        print('Login successful: ${response.data}');
      } else {
        throw Exception('Login failed');
      }
    } on DioError catch (e) {
      // Handle Dio errors
      print('Dio error: ${e.message}');
      throw Exception('Login failed: ${e.message}');
    } catch (e) {
      // Handle other errors
      print('Error: $e');
      throw Exception('Login failed: $e');
    }
  }

  Future<void> signUp(String username, String firstName, String lastName, 
                      String email, String password, String gender) async {
    try {
      final response = await _dio.post(
        '/users',
        data: {
          'username': username,
          'first_name': firstName,
          'last_name': lastName,
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
        throw Exception('Sign up failed');
      }
    } on DioError catch (e) {
      print('Error: ${e.response?.statusCode}, ${e.message}');
      throw Exception('Sign up failed: ${e.message}');
    }
  }
}