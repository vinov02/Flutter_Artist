import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exit Confirmation',
      home: ExitConfirmationPage(),
    );
  }
}

class ExitConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show an exit confirmation dialog
        bool exit = (await _showExitConfirmationDialog(context)) as bool;
        return exit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exit Confirmation'),
        ),
        body: Center(
          child: Text('Press the back button to see the exit confirmation dialog.'),
        ),
      ),
    );
  }

  Future<Future<bool?>> _showExitConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Exit App?'),
          content: Text('Do you really want to exit the app?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel the exit
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm the exit
              },
              child: Text('Exit'),
            ),
          ],
        );
      },
    );
  }
}
