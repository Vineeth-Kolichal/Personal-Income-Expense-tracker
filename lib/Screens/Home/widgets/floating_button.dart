import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/Add_Transactions/screen_add_transaction.dart';
import 'package:money_management_app/Screens/Home/screen_home.dart';
import 'package:money_management_app/models/category/category_add_popup.dart';

class FloatingButton extends StatefulWidget {

  const FloatingButton({Key? key}) : super(key: key);

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  bool? _visible ;

  void visibleCheck(int test) {
    if (test != 0) {
      setState(() {
        _visible = true;
      });
    }
    else{
      setState(() {
        _visible=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    visibleCheck(HomeScreen.selectIndexNotifier.value);
    return Visibility(
      visible: _visible!,
      child: FloatingActionButton(
        onPressed: () {
          if (HomeScreen.selectIndexNotifier.value == 1 ) {
            Navigator.of(context).pushNamed(ScreenAddTrasaction.routName);
          } else if (HomeScreen.selectIndexNotifier.value == 2) {
            ShowCategoryAddPopup(context);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
