import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tiqtshop/main.dart';
import 'package:tiqtshop/screens/Home.dart';

class AuthService {
  late Dio _dio = Dio();
  final String _baseUrl = 'https://api.tiqtshop.kubwacu.com/users/auth';
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
        '$_baseUrl',
        data: {
          'identifier': email,
          'password': password,
        },
      );

      if (response.statusCode == 202) {
        Navigator.pushNamed(ctx,"/screens/Home", arguments: {"name":});
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
}
