import 'package:bravo_french_book/screens/question_page.dart';
import 'package:bravo_french_book/widgets/main_buttons.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import '../widgets/app_bar.dart';

class ContentButtons extends StatefulWidget {
  static const routeName = '/content';

  @override
  State<ContentButtons> createState() => _ContentButtonsState();
}

class _ContentButtonsState extends State<ContentButtons>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBravo(context) as PreferredSizeWidget?,
      extendBodyBehindAppBar: true,
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            spawnMaxRadius: 100,
            spawnMinSpeed: 10.00,
            particleCount: 20,
            spawnMaxSpeed: 20,
            minOpacity: 0.1,
            spawnOpacity: 0.4,
            // baseColor: Colors.red,
            image: Image(
              image: AssetImage('assets/images/logo bravo1.png'),
            ),
          ),
        ),
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 80,
              ),
              MainButtons('Lessons', Theme.of(context).primaryColor, () {}),
              MainButtons('Revision', Theme.of(context).primaryColor, () {}),
              MainButtons('Questions', Theme.of(context).primaryColor, () {
                Navigator.of(context).pushNamed(QuestionPage.routeName);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
