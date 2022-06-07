import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/DrawerScreens/about_page.dart';
import 'package:money_management_app/Screens/DrawerScreens/screen_how_to_use.dart';
import 'package:money_management_app/Screens/DrawerScreens/screen_transaction_month.dart';
import 'package:money_management_app/Screens/DrawerScreens/screen_transaction_today.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: Stack(children: [
        ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Text(
                    'Income & Expense Tracker',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                // image: DecorationImage(
                //   image: AssetImage('assets/images/income_expence.png'),
                // ),
              ),
            ),
            Card(
              child: ListTile(
                //leading: CircleAvatar(child: Text('D')),
                leading: Icon(Icons.today),
                title: Text('Transactions-Today'),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ScreenTransactionDay.routName);
                },
              ),
            ),
            Card(
              child: ListTile(
                //leading: CircleAvatar(child: Text('M')),
                leading: Icon(Icons.calendar_month),
                title: Text('Transactions-This month'),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ScreenTransactionMonth.routName);
                },
              ),
            ),
            // Card(
            //   child: ListTile(
            //     //leading: CircleAvatar(child: Text('H')),
            //     leading: Icon(Icons.question_mark),
            //     title: Text('How to use'),
            //     onTap: () {
            //       Navigator.of(context).pushNamed(ScreenHowToUse.routName);
            //     },
            //   ),
            // ),
            SizedBox(
              height: 200,
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: ListTile(
            onTap: (() {
              Navigator.of(context).pushNamed(AboutPage.routName);
            }),
            title: Text('About'),
            subtitle: Text('Version:1.0'),
          ),
        ),
      ]),
    );
  }
}
