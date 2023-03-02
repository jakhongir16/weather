import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/ui/pages/home_page/home_page.dart';
class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splash.gif',
      nextScreen: const HomePage(),
      backgroundColor: Colors.blue,
      duration:3000,
    );
  }
}
