import 'package:flutter/material.dart';
import 'package:tiqtshop/screens/Home.dart';
import 'package:tiqtshop/screens/Verified.dart';
import 'package:tiqtshop/screens/login.dart';

Route onGeneratedRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) {
    switch (settings.name) {
      case '/screens/Home':
      
        return const MyHomePage(title: "Home Page");
      case '/screens/login':
        return LoginPage();
      case '/screens/verified':
        return VerificationPage();

      default:
        return LoginPage();
    }
  });
}
