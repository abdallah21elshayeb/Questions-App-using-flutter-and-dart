import 'package:bravo_french_book/screens/about_bravo.dart';
import 'package:bravo_french_book/screens/content_buttons.dart';
import 'package:bravo_french_book/screens/main_page.dart';
import 'package:bravo_french_book/screens/question_page.dart';
import 'package:bravo_french_book/widgets/splash_page.dart';
import 'package:bravo_french_book/widgets/wave_background.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
      ),
      home: const SplashPage(),
      routes: {
        MainPage.routeName: (context) => MainPage(),
        AboutBravo.routeName: (context) => AboutBravo(),
        ContentButtons.routeName: (context) => ContentButtons(),
        QuestionPage.routeName: (context) => QuestionPage(),
        WaveBackground.routeName: (context) => WaveBackground(),
      },
    );
  }
}
