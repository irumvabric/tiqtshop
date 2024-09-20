import 'package:flutter/material.dart';
import 'package:tiqtshop/backend/auth.dart';
import 'package:tiqtshop/widgets/Barcode_scanner_simple.dart';
import 'package:tiqtshop/widgets/bottom_navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.title});

  void fetchUserInfo() async {
    AuthService authService = AuthService();
    var userInfo = await authService.getUserInfo();

    if (userInfo != null) {
      print('User Info: $userInfo');
      // Do something with the user information
    } else {
      print('Failed to get user info');
    }
  }

  final String title;

  @override
  Widget build(BuildContext context) {
    // Return content directly without Scaffold
    return Center(
      child: Text('This is the profile page.'),
    );
  }
}
