import 'package:artist_community/src/components/g_nav.dart';
import 'package:flutter/material.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF6078EA),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio:
                      1, // This maintains a square aspect ratio for the content
                  child: Image.asset(
                    'assets/vino.jpg', // Replace with your image asset
                    fit: BoxFit
                        .cover, // Adjust how the image fits within the AspectRatio
                  ),
                ),
              ), // Replace with profile image
            ),
            Positioned(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Color(0xFF6078EA),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              initialValue: '', // Replace with actual data
              decoration: const InputDecoration(
                  labelText: 'Enter Your Name',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6078EA)),
                  )
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: '', // Replace with actual data
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: 'Enter Phone Number',
                  labelStyle: TextStyle(color: Colors.black,),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6078EA)),
                  )
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              initialValue: '', // Replace with actual data
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Enter Email',
                  labelStyle: TextStyle(color: Colors.black,),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6078EA)),
                  )
            ),
            ),
             const SizedBox(height: 12.0),
            TextFormField(
              initialValue: '', // Replace with actual data
              decoration: const InputDecoration(
                labelText: 'Enter Address',
                labelStyle: TextStyle(color: Colors.black,),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6078EA)),
                  )
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  // Update profile logic
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: const Color(0xFFF54EA2),
                  fixedSize: const Size(180.0, 50.0),
                ),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(color: Colors.white,),
                )),
          ],
        ),
      ),
    );
  }
}
