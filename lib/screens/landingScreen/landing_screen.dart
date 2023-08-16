import 'package:automynd/screens/homeScreen/home_screen.dart';
import 'package:automynd/screens/profileScreen/profile_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;
  final List<Widget> _bottomNavPage = [
    const HomeScreen(),
    // const Text("data"),
    // const Text("dat"),
    const ProfileScreen()
  ];

  changePage(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xff46A6C0),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: "Home",
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: "Home",
            // ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
          ]),
      body: _bottomNavPage[_currentIndex],
    );
  }
}
