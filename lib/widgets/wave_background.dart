import 'package:bravo_french_book/widgets/animated_wave.dart';
import 'package:bravo_french_book/widgets/clip_shadow_path.dart';
import 'package:flutter/material.dart';

class WaveBackground extends StatelessWidget {
  static const routeName = '/wave-background';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        children: [
          ClipShadowPath(
            shadow: const BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 8,
            ),
            clipper: BigClipper(),
            child: Container(
              color: Colors.purpleAccent,
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
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
