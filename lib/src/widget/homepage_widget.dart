import 'package:artist_community/src/components/app_drawer.dart';
import 'package:artist_community/src/widget/home_page_widget_body.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(), // Use AppDrawer as the drawer
      body: HomePageWidgetBody(),
    );
  }
}
