import 'package:bravo_french_book/widgets/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:bravo_french_book/screens/about_bravo.dart';
import 'package:bravo_french_book/screens/main_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialMedia { facebook, twitter, instgram, youtube }

class MainDrawer extends StatelessWidget {
  Future share(SocialMedia socialPlatform) async {
    final urls = {
      SocialMedia.facebook: 'https://www.facebook.com/bravo.fr/',
      SocialMedia.twitter: 'https://twitter.com/BravoFrancais',
      SocialMedia.instgram: 'https://www.instagram.com/bravoenfrancais/',
      SocialMedia.youtube:
          'https://www.youtube.com/channel/UCiQa6MWm6jE-7dPScWyI3bg',
    };
    final url = urls[socialPlatform]!;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RootoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler as void Function()?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 219, 219, 219),
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Text(
            'Bravo!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        buildListTile('Home', Icons.home, () {
          Navigator.of(context).pushNamed(MainPage.routeName);
        }),
        buildListTile('About Bravo!', Icons.person, () {
          Navigator.of(context).pushNamed(AboutBravo.routeName);
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaButton(
              icon: FontAwesomeIcons.facebook,
              color: Colors.black,
              onClicked: () => share(SocialMedia.facebook),
            ),
            SocialMediaButton(
              icon: FontAwesomeIcons.twitter,
              color: Colors.black,
              onClicked: () => share(SocialMedia.twitter),
            ),
            SocialMediaButton(
              icon: FontAwesomeIcons.instagram,
              color: Colors.black,
              onClicked: () => share(SocialMedia.instgram),
            ),
            SocialMediaButton(
              icon: FontAwesomeIcons.youtube,
              color: Colors.black,
              onClicked: () => share(SocialMedia.youtube),
            ),
          ],
        )
      ]),
    );
  }
}
