import 'package:flutter/material.dart';
import 'package:bravo_french_book/widgets/app_bar.dart';
import 'package:bravo_french_book/widgets/main_drawer.dart';
import 'package:bravo_french_book/widgets/scroll_buttons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/animated_wave.dart';
import '../widgets/clip_shadow_path.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/home';
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBravo(context) as PreferredSizeWidget?,
      drawer: MainDrawer(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(children: [
        ClipShadowPath(
          shadow: const BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
            blurRadius: 4,
            spreadRadius: 8,
          ),
          clipper: BigClipper(),
          child: Container(
            color: Colors.red,
          ),
        ),
        ClipShadowPath(
          shadow: const BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
            blurRadius: 4,
            spreadRadius: 8,
          ),
          clipper: SmallClipper(),
          child: Container(
            color: Colors.white,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const ScrollButtons(),
                const SizedBox(
                  height: 90,
                ),
                const Image(
                  image: AssetImage('assets/images/bravoo.png'),
                  height: 200,
                  width: 320,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'An innovative and simple presentation with a new and sophisticated thought to ensure excellence in the French language.',
                    style: GoogleFonts.sansitaSwashed(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
