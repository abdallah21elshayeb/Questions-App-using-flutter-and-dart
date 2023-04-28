import 'package:bravo_french_book/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class AboutBravo extends StatelessWidget {
  static const routeName = '/about-bravo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBravo(context) as PreferredSizeWidget?,
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            const Image(
              height: 200,
              width: 300,
              image: AssetImage('assets/images/logo 2.png'),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Table(
                defaultColumnWidth: const FixedColumnWidth(150),
                border: TableBorder.all(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  width: 2,
                ),
                children: [
                  TableRow(
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Address',
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text('دوران النادي, شارع النجاشي, طنطا, الغربية')
                        ],
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Phone Numbers',
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text('- +201149895557'),
                          Text('- +201158901349'),
                        ],
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Column(
                          children: const [
                            Text(
                              'Email Address',
                              style: TextStyle(fontSize: 15, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: const [
                          Text('info@bravo-book.com'),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
