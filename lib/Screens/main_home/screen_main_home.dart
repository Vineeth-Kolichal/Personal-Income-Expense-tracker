import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';

class ScreenMainHome extends StatelessWidget {
  const ScreenMainHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryDB.instance.refreshUI();
    TransactionDB.instance.refresh();
    return Center(child: Text('test'),);
  }
}