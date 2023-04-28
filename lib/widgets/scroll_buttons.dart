import 'package:bravo_french_book/screens/content_buttons.dart';
import 'package:flutter/material.dart';
import './main_buttons.dart';

class ScrollButtons extends StatelessWidget {
  const ScrollButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MainButtons('1st prep', Theme.of(context).primaryColor, () {
            Navigator.of(context).pushNamed(ContentButtons.routeName);
          }),
          MainButtons('2nd prep', Theme.of(context).primaryColor, () {}),
          MainButtons('3rd prep', Theme.of(context).primaryColor, () {}),
          MainButtons(
              '1st sec', Theme.of(context).colorScheme.secondary, () {}),
          MainButtons(
              '2nd sec', Theme.of(context).colorScheme.secondary, () {}),
          MainButtons(
              '3rd sec', Theme.of(context).colorScheme.secondary, () {}),
        ],
      ),
    );
  }
}
