import 'package:bravo_french_book/main.dart';
import 'package:bravo_french_book/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: SizedBox(
          height: 200,
          width: 200,
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/bravo logo.jpeg'),
              ),
            ],
          ),
        ),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 200,
        duration: 2000,
        nextScreen: MainPage(),
      ),
    );
  }
}
