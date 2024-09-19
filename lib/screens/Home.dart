import 'package:flutter/material.dart';
import 'package:tiqtshop/widgets/Barcode_scanner_simple.dart';
import 'package:tiqtshop/widgets/bottom_navigation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tiqtshop/screens/Verified.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List of pages for each BottomNavigationBar item
  final List<Widget> _pages = [
    Center(child: Text("Home Page")),
    Barcode_scanner(),
    VerificationPage(),
    VerificationPage(),
  ];

  // Function to handle BottomNavigationBar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_selectedIndex], // Display the current selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_rounded),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
