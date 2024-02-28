import 'package:artist_community/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 250),
            const  Align(
                alignment: Alignment.center,
                child: Text(
                  "Let's",
                  style: TextStyle(
                      fontFamily: 'JustMe', fontSize: 28, color: Colors.black),
                ),
              ),
             const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Text(
                    "Create",
                    style:
                    TextStyle(fontFamily: 'JustMe', color: Colors.black,fontSize: 28),
                  ),
                   SizedBox(width: 10,),
                   Text(
                    "ARTist",
                    style:
                    TextStyle(fontFamily: 'JustMe', color: Color(0xFF6078EA),fontSize: 59),
                  ),
                   SizedBox(width: 10,),
                   Text(
                    "Work",
                    style:
                    TextStyle(fontFamily: 'JustMe', color: Colors.black,fontSize: 28),
                  ),
                ],
              ),
            const SizedBox(height: 60,),
            const Align(
              alignment: Alignment.center,
               child:  Text("Enjoy your work! Take a photo , share to",
               style: TextStyle(
               fontFamily: 'Poppins',
               ),
               ),
             ),
              const Align(
                alignment: Alignment.center,
                child:  Text("the world and tag me",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),

             const SizedBox(height: 40,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: const Color(0xFFF54EA2),
                  fixedSize: const Size(180.0, 50.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>   LoginPage()),);
                },
                child: const Text(
                  "Let's get started",
                  style: TextStyle(fontFamily: 'Poppins',color: Colors.white,fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
