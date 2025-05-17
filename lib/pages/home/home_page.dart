import 'package:flutter/material.dart';
import 'package:mtest_app/pages/home/pages/chat_navbar_page.dart';
import 'package:mtest_app/pages/home/pages/graph_navbar_page.dart';
import 'package:mtest_app/pages/home/pages/home_navbar_page.dart';
import 'package:mtest_app/pages/home/pages/profile_navbar_page.dart';
import 'package:mtest_app/pages/home/pages/qpay_navbar_page.dart';
import 'package:mtest_app/theme/colors/support_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  /// Bottom navbar pages
  final List<Widget> _pages = [
    HomeNavPage(),
    const GraphNavPage(),
    const QPayNavPage(),
    const ChatNavPage(),
    const ProfileNavPage(),
  ];

  @override
Widget build(BuildContext contexta) {
    return Scaffold(
      backgroundColor: SupportColors.backgroundColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// Bottom navbar
              _navItem('assets/images/home.png', 0),
              _navItem('assets/images/graph.png', 1),
              _navItem('assets/images/qpay.png', 2),
              _navItem('assets/images/chat.png', 3),
              _navItem('assets/images/profile.png', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String imagePath, int index) {
    final isSelected = _currentIndex == index;

    if (index == 2) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: SupportColors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              height: 36,
              width: 36,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Image.asset(
        imagePath,
        height: 32,
        width: 32,
        color: isSelected ? SupportColors.blue : Colors.grey,
      ),
    );
  }
}
