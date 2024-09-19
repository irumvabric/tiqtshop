import 'package:flutter/material.dart';
import 'package:tiqtshop/widgets/Barcode_scanner_simple.dart';
import 'package:tiqtshop/widgets/bottom_navigation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tiqtshop/screens/Verified.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Remove the Scaffold from here
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerificationPage(),
                ),
              );
            },
            child: const Text("Mobile Scanner Simple"),
          ),
        ],
      ),
    );
  }
}
