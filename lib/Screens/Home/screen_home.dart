import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/Add_Transactions/screen_add_transaction.dart';
import 'package:money_management_app/Screens/Category/screen_Category.dart';
import 'package:money_management_app/Screens/Home/widgets/bottomNavigation.dart';
import 'package:money_management_app/Screens/Transactions/screen_Transactions.dart';
import 'package:money_management_app/Screens/main_home/screen_main_home.dart';
import 'package:money_management_app/models/category/category_add_popup.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/db/category/category_db.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _pages = [
    ScreenMainHome(),
    ScreenTransactions(),
    ScreenCategory(),
  ];
  static ValueNotifier<int> selectIndexNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(child: Text('test')),
      appBar: AppBar(
        title: Center(
          child: Text('Income&Expence Tracker'),
        ),
      ),
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: MoneyBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectIndexNotifier.value == 0 || selectIndexNotifier.value ==1) {
            print('transactions page');
            Navigator.of(context).pushNamed(ScreenAddTrasaction.routName);
          } else {
            ShowCategoryAddPopup(context);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
