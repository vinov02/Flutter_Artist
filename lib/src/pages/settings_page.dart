import 'package:artist_community/src/widget/profile_page_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool receiveNotifications = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: const Text('Change Username'),
              subtitle: const Text('Update your display name'),
              onTap: () {
                // Navigate to the change username screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePageWidget()),
                );
              },
            ),
            ListTile(
              title: const Text('Change Email'),
              subtitle: const Text('Update your email address'),
              onTap: () {
                // Navigate to the change email screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePageWidget()),
                );
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: const Text('Receive Notifications'),
              subtitle: const Text('Enable or disable notifications'),
              value: true, // Replace with the actual user preference
              onChanged: (value) {
                // Handle the notification toggle
                setState(() {
                  receiveNotifications = value;
                  // Perform any additional actions based on the toggle state
                  handleNotificationToggle(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
void handleNotificationToggle(bool value) {
  // Implement logic to update the user's notification preferences
  print('Receive Notifications: $value');
  // You can perform additional actions based on the toggle state
}