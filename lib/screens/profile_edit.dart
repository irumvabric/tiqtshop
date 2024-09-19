import 'package:flutter/material.dart';
import 'package:tiqtshop/widgets/Barcode_scanner_simple.dart';
import 'package:tiqtshop/widgets/bottom_navigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Return content directly without Scaffold
    return Center(
      child: Text('This is the profile page.'),
    );
  }
}
