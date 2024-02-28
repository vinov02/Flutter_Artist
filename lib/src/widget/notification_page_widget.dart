import 'package:flutter/material.dart';

class NotificationPageWidget extends StatelessWidget {
  const NotificationPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Your Notification Page content
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Message'
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     const Expanded(
            //       child: Text(
            //         '',
            //         style: TextStyle(
            //             fontSize: 24.0,
            //
            //             fontFamily: 'Poppins'
            //         ),
            //       ),
            //     ),
            //     IconButton(
            //       icon: const Icon(Icons.edit,color: Color(0xFFF54EA2),),
            //       onPressed: () {
            //         // Handle edit button press
            //       },
            //     ),
            //   ],
            // ),
            const SizedBox(height: 10,),

            const SizedBox(height: 0.0),
            Expanded(
              child: ListView(
                children: [
                  buildMessageItem('Anasooya', 'Hey there!', '10:30 AM', 2,"assets/anasooya.jpg"),
                  buildMessageItem('Admin ', 'How are you?', '11:45 AM', 1,"assets/gfgimage.png"),
                  buildMessageItem(
                      'Alice', 'Your art work is amazing!', '12:15 PM', 5,"assets/anasooya.jpg"),
                  // Add more message items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildMessageItem(
    String name, String message, String time, int unreadCount, String assetImagePath) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: assetImagePath.isNotEmpty
          ? const AssetImage("assets/anasooya.jpg") // Load image from asset
          : null, // If assetImagePath is empty, no image will be displayed
      backgroundColor: Colors.blue,
    ),
    title: Text(name),
    subtitle: Row(
      children: [
        Expanded(
          child: Text(message),
        ),
        Text(time),
      ],
    ),
    trailing: unreadCount > 0
        ? CircleAvatar(
      backgroundColor: Color(0xFF6078EA),
      radius: 10.0,
      child: Text(
        unreadCount.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    )
        : null,
    onTap: () {
      // Handle tapping on a message item
    },
  );
}
