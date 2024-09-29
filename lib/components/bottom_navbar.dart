import 'package:expose_corruption_app/screens/help.dart';
import 'package:expose_corruption_app/screens/home.dart';
import 'package:expose_corruption_app/screens/report.dart';
import 'package:expose_corruption_app/screens/report_details.dart';
import 'package:expose_corruption_app/screens/report_status.dart';
import 'package:expose_corruption_app/screens/settings.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
  data: Theme.of(context).copyWith(
    canvasColor: const Color(0xFF4B0082), 
    primaryColor: Colors.white,
    bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme.copyWith(
      selectedLabelStyle: const TextStyle(color: Color(0xFF00FFFF)),
      unselectedLabelStyle: const TextStyle(color: Color(0xFF4169E1)),
    ),
      
      ),
      child: BottomNavigationBar(
        selectedItemColor: Color(0xFF00FFFF),
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.edit_document),
        label: 'Report',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt_outlined),
        label: 'My Reports',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.timeline),
        label: 'Report Status',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.help),
        label: 'Resources',
      ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Home(
                ),
              ),
            );
            } else if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Report(),
              ));
          } else if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ReportDetails()
              ));
          } else if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ReportStatus(),
            ));
          } else if (index == 4) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Help()
            ));
          }
        },
      ),
    );
  }
  }