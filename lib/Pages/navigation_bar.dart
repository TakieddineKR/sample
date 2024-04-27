import 'package:flutter/material.dart';
import './add_request.dart';
import './history.dart';
import './home_donation_R.dart';
import './setting.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  final screens = [
    DonationRequestsPage(),
    AddRequestScreen(),
    DonationHistoryScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index], // Display the selected page
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.deepPurple[200],
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index), // Corrected typo here
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.add_outlined,
              ),
              label: 'Request',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.history_edu_outlined,
              ),
              label: 'History',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
