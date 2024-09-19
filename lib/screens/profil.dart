import 'package:flutter/material.dart';
import 'package:tiqtshop/widgets/Barcode_scanner_simple.dart';
import 'package:tiqtshop/widgets/bottom_navigation.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Return content directly without Scaffold
    return Center(
      child: Text('Edit your profile here.'),
    );
  }
}
