import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/Category/screen_Category.dart';
import 'package:money_management_app/Screens/Home/widgets/bottomNavigation.dart';
import 'package:money_management_app/Screens/Transactions/screen_Transactions.dart';
import 'package:money_management_app/models/category/category_add_popup.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/db/category/category_db.dart';

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
          if (selectIndexNotifier.value == 0) {
            print('transactions page');
          } else  {
            print('category page');
            ShowCategoryAddPopup(context);
            // final _sample = CategoryModel(
            //   id: DateTime.now().microsecondsSinceEpoch.toString(),
            //   name: 'travel',
            //   type: CategoryType.expense,
            // );
            // categoryDB().insertCategory(_sample);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
