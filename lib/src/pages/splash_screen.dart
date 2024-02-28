import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:artist_community/src/pages/first_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/Animation - 1704688146424.json',
        width: 800,
        height: 800,
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
      nextScreen: const FirstPage(),
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
