import 'package:artist_community/src/pages/settings_page.dart';
import 'package:artist_community/src/widget/profile_page_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HomePageWidgetBody extends StatelessWidget {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final FirebaseStorage _storage = ;
  HomePageWidgetBody({super.key});
  String? fileName;

  Future<List<String>> _fetchImagesFromFirebase() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection('categories').get();

      List<String> imageUrls = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        String imageUrl =
        await FirebaseStorage.instance.ref('categoryImage').getDownloadURL();
        imageUrls.add(imageUrl);
      }


      return imageUrls;

    } catch (e) {
      print('Error fetching images: $e');
    }

    return [];
  }


  Future<void> _signOut(context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop(); // Close the dialog
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop(); // Pop back to the login page
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xFF6078EA),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                        color: Color(0xFFF54EA2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Vino V",
                      style: TextStyle(

                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color(0xFF6078EA),
                  ),
                  onPressed: () {
                    showMenu(
                        color: Colors.white,
                        context: context,
                        position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                        items: [
                          const PopupMenuItem(
                            value: 'option1',
                            child: Text(
                              'Settings',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'option2',
                            child: Text(
                              'Profile',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'option3',
                            child: Text(
                              'Clear All',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ]).then((value) {
                      if (value != null) {
                        handleMenuItem(context, value);
                      }
                    });
                  },
                ),
                IconButton(onPressed: (){
                  _signOut(context);
                }
                    , icon:const Icon (Icons.logout)),

              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle:
                  TextStyle( color: Colors.black),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),

            FutureBuilder<List<String>>(
              future: _fetchImagesFromFirebase(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No images available.');
                } else {
                  return SizedBox(

                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      snapshot.data![index],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Image Title',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),

            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children :[
                    Text(
                      "Trending Art",
                      style: TextStyle(
                          fontSize: 20,

                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(
                          fontSize: 16,

                          color: Color(0xFF6078EA),
                          fontWeight: FontWeight.w500),
                    ),
                  ]
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:Row(children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/anasooya.jpg'),
                ),
                SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'anasooyasasindran',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
                )
              ]
              ),
            ),
            const Image(image: AssetImage("assets/545.jpg")),
            const Padding(padding: EdgeInsets.all(8.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.bookmark_add_outlined,
                      size: 30,
                    ),
                    Text("Save",
                      style: TextStyle(
                          fontSize: 20
                      ),)
                  ],
                )
            ),
            const SizedBox(height: 30,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:Row(children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/vino.jpg'),
                ),
                SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'vinoviji',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
                )
              ]
              ),
            ),
            const Image(image: AssetImage("assets/545.jpg")),
          ],
        ),
      ),
    );
  }

  void handleMenuItem(BuildContext context, String value) {
    switch (value) {
      case 'option1':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
        break;
      case 'option2':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePageWidget()),
        );
        break;
      default:
    }
  }
}
