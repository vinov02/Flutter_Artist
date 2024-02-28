import 'package:flutter/material.dart';
import 'package:artist_community/src/widget/homepage_widget.dart';
import 'package:artist_community/src/widget/notification_page_widget.dart';
import 'package:artist_community/src/widget/profile_page_widget.dart';
import 'package:artist_community/src/widget/upload_page_widget.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  // List of widgets to display in the body
  final List<Widget> pages = [
    HomePageWidget(),
    const UploadImageAndMore(),
    const NotificationPageWidget(),
    const ProfilePageWidget(),
  ];

  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Exit'),
        content: const Text('Are you sure you want to exit the app?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),

            child: const Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: const Color(0xFF363437),
        body: pages[selectedIndex], // Display the selected page
        bottomNavigationBar: Container(
          height: 93,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: GNav(
              gap: 8,
              color: Colors.black,
              activeColor: Colors.white,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  backgroundColor: Color(0xFF6078EA),
                ),
                GButton(
                  icon: Icons.add,
                  text: 'Upload',
                  backgroundColor: Color(0xFF4DB6AC),
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Notification',
                  backgroundColor: Colors.blueGrey,
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  backgroundColor: Color(0xFF6078EA),
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
