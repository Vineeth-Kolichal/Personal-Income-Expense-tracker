import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/Category/screen_Category.dart';
import 'package:money_management_app/Screens/Home/widgets/bottomNavigation.dart';
import 'package:money_management_app/Screens/Transactions/screen_Transactions.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _pages = [
    ScreenTransactions(),
    ScreenCategory(),
    
  ];
  static ValueNotifier<int> selectIndexNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MoneyBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
    );
  }
}
