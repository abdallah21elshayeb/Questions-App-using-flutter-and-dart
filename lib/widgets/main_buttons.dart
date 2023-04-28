import 'package:flutter/material.dart';

class MainButtons extends StatelessWidget {
  final String title;
  final Color color;
  final Function add;

  MainButtons(this.title, this.color, this.add);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: add as void Function()?,
      splashColor: Colors.purpleAccent,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(1), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
