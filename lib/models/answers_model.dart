import 'dart:ffi';

import 'package:flutter/material.dart';

class AnswersModel extends StatelessWidget {
  final Color? answerColor;
  final String? answerText;
  final void Function()? answerFunction;

  AnswersModel({this.answerColor, this.answerText, this.answerFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerFunction,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 30,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: answerColor,
          border: Border.all(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          answerText!,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
