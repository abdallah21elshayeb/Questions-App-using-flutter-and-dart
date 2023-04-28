import 'package:flutter/material.dart';

Widget AppBarBravo(BuildContext context) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.red),
    elevation: 0,
    titleSpacing: 0,
    toolbarHeight: 70,
    backgroundColor: Colors.white,
    flexibleSpace: Container(
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/logo bravo1.png'),
            fit: BoxFit.contain),
      ),
    ),
  );
}
