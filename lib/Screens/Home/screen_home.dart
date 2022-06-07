import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:money_management_app/Screens/Add_Transactions/screen_add_transaction.dart';
import 'package:money_management_app/Screens/Category/screen_Category.dart';
import 'package:money_management_app/Screens/Home/widgets/bottomNavigation.dart';
import 'package:money_management_app/Screens/Home/widgets/drawer_page.dart';
import 'package:money_management_app/Screens/Home/widgets/floating_button.dart';
import 'package:money_management_app/Screens/Transactions/screen_Transactions.dart';
import 'package:money_management_app/Screens/main_home/screen_main_home.dart';
// import 'package:money_management_app/models/category/category_add_popup.dart';
// import 'package:money_management_app/models/category/category_model.dart';
// import 'package:money_management_app/db/category/category_db.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> selectIndexNotifier = ValueNotifier(0);
  int pageIndex = 0;
  final _pages = [
    ScreenMainHome(),
    ScreenTransactions(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectIndexNotifier,
      builder: (BuildContext ctx, int number, Widget? _) {
        return Scaffold(
          drawer: DrawerPage(),
          appBar: AppBar(
            title: Text('Income & Expense Tracker'),
          ),
          backgroundColor: Colors.grey[100],
          bottomNavigationBar: MoneyBottomNavigation(),
          body: SafeArea(
            child: Builder(
              builder: (context) {
                return _pages[number];
              },
            ),
          ),
          floatingActionButton: FloatingButton(),
        );
      },
    );
    // return Scaffold(
    //   //drawer: Drawer(child: Text('test')),
    //   appBar: AppBar(
    //     title: Center(
    //       child: Text('Income&Expence Tracker'),
    //     ),
    //   ),
    //   backgroundColor: Colors.grey[100],
    //   bottomNavigationBar: MoneyBottomNavigation(),
    //   body: SafeArea(
    //     child: ValueListenableBuilder(
    //       valueListenable: HomeScreen.selectIndexNotifier,
    //       builder: (BuildContext context, int updatedIndex, _) {
    //         pageIndex=updatedIndex;
    //         return _pages[updatedIndex];

    //       },
    //     ),
    //   ),

    //   floatingActionButton: FloatingButton(),
    // Visibility(
    //   visible: _visible,
    //   child: FloatingActionButton(
    //     onPressed: () {
    //       if (HomeScreen.selectIndexNotifier.value == 1) {
    //         Navigator.of(context).pushNamed(ScreenAddTrasaction.routName);
    //       } else if (HomeScreen.selectIndexNotifier.value == 2) {
    //         ShowCategoryAddPopup(context);
    //       }
    //     },
    //     child: Icon(Icons.add),
    //   ),
    // ),
    //);
  }
}
