import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        String token = response.data['token'];
        Navigator.pushNamed(ctx, "/screens/Home");
        print('Login successful: ${response.data['token']}');
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
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'username': username,
          'password': password,
          'gender': gender,
        },
      );

      if (response.statusCode == 400) {
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

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<Map<String, dynamic>?> getUserInfo() async {
    String? token = await getToken(); // Fetch the token
    if (token == null) {
      print('Token not found');
      return null;
    }

    try {
      // Make a request to the user information endpoint
      Response response = await _dio.get(
        'https://api.tiqtshop.kubwacu.com/users/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Parse and return the user information
        return response.data;
      } else {
        print('Failed to fetch user info: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching user info: $e');
      return null;
    }
  }
}
