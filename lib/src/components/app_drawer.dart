import 'package:artist_community/src/pages/settings_page.dart';
import 'package:artist_community/src/widget/profile_page_widget.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF052EA4),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/vino.jpg'),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Vino V',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Poppins'
                    ),
                  ),
                  Text(
                    'vinoviji676@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins'
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home',
            style: TextStyle(
            fontFamily: 'Poppins',
              fontWeight: FontWeight.w600
            ),
            ),
            onTap: () {
              // Handle tap on Home
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile',
              style: TextStyle(
                  fontFamily: 'Poppins',
                fontWeight: FontWeight.w600
              ),
            ),
            onTap: () {
              // Handle tap on Profile
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePageWidget()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings',
              style: TextStyle(
                  fontFamily: 'Poppins',
                fontWeight: FontWeight.w600
              ),
            ),
            onTap: () {
              // Handle tap on Settings
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout',
              style: TextStyle(
                  fontFamily: 'Poppins',
                fontWeight: FontWeight.w600
              ),
            ),
            onTap: () {
              // Handle tap on Logout
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
