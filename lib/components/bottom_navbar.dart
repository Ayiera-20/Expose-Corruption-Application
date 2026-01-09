import 'package:expose_corruption_app/screens/help.dart';
import 'package:expose_corruption_app/screens/home.dart';
import 'package:expose_corruption_app/screens/report.dart';
import 'package:expose_corruption_app/screens/report_details.dart';
import 'package:expose_corruption_app/screens/report_status.dart';
import 'package:expose_corruption_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  
  const MyBottomNavigationBar({
    super.key,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.textLight,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            activeIcon: Icon(Icons.edit_document),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list_alt),
            label: 'My Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline_outlined),
            activeIcon: Icon(Icons.timeline),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            activeIcon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
        onTap: (index) {
          if (index == currentIndex) return; // Don't navigate if already on the page
          
          if (index == 0) {
            // Go back to Home, pop all routes until Home
            Navigator.of(context).pushAndRemoveUntil(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const Home(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 300),
              ),
              (route) => route.isFirst,
            );
          } else if (index == 1) {
            // Navigate to Report screen
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Report()),
            );
          } else if (index == 2) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const ReportDetails()),
              (route) => route.isFirst,
            );
          } else if (index == 3) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const ReportStatus()),
              (route) => route.isFirst,
            );
          } else if (index == 4) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Help()),
              (route) => route.isFirst,
            );
          }
        },
      ),
    );
  }
}

// import 'package:expose_corruption_app/screens/help.dart';
// import 'package:expose_corruption_app/screens/home.dart';
// import 'package:expose_corruption_app/screens/report.dart';
// import 'package:expose_corruption_app/screens/report_details.dart';
// import 'package:expose_corruption_app/screens/report_status.dart';
// import 'package:flutter/material.dart';


// class MyBottomNavigationBar extends StatefulWidget {
//   const MyBottomNavigationBar({super.key});

//   @override
//   State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _currentIndex = 0;  // Keep track of the selected page
//   final PageController _pageController = PageController();  // Controller for PageView

//   @override
//   void dispose() {
//     _pageController.dispose();  // Dispose of the controller to avoid memory leaks
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _currentIndex = index;  
//           });
//         },
//         children:  [
//           Home(),  
//           Report(),
//           ReportDetails(),
//           ReportStatus(),
//           Help(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: const Color(0xFF00FFFF),  
//         unselectedItemColor: Colors.white,  
//         backgroundColor: const Color(0xFF4B0082), 
//         currentIndex: _currentIndex,  
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;  
//           });
//           _pageController.jumpToPage(index);  
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.edit_document),
//             label: 'Report',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list_alt_outlined),
//             label: 'My Reports',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.timeline),
//             label: 'Report Status',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.help),
//             label: 'Resources',
//           ),
//         ],
//       ),
//     );
//   }
// }
