import 'package:flutter/material.dart';
import 'package:tiqtshop/screens/Home.dart';
import 'package:tiqtshop/screens/login.dart';
import 'package:tiqtshop/route.dart';
import 'package:tiqtshop/widgets/Barcode_scanner_simple.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TiqtShop',
      debugShowCheckedModeBanner: false,
      initialRoute: '/Home',
      onGenerateRoute: (route) => onGeneratedRoute(route),
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
