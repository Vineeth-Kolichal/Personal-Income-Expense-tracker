import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/Transactions/screen_transactions.dart';
import 'package:money_management_app/Screens/main_home/total_display.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';

class ScreenMainHome extends StatelessWidget {
  //final double _sum =sum();
  ScreenMainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryDB.instance.refreshUI();
    TransactionDB.instance.refresh();
    TransactionDB.instance.refreshHome();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'All',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // ListTile(
                  //   title: Text('All'),
                  // ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          //child: TotalIncome(),
                          child: TotalDisplay(
                            totalValue: TransactionDB.instance.allIncome,
                            textColor: Colors.green,
                            titie: 'Income',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 60,
                        width: 3,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: TotalDisplay(
                              totalValue: TransactionDB.instance.allExpense,
                              textColor: Colors.red,
                              titie: 'Expense'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          //SizedBox(width: 30,),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'This month',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: TotalDisplay(
                              totalValue: TransactionDB.instance.monthIncome,
                              textColor: Colors.green,
                              titie: 'Income'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 60,
                        width: 3,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: TotalDisplay(
                              totalValue: TransactionDB.instance.monthExpense,
                              textColor: Colors.red,
                              titie: 'Expense'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // SizedBox(width: 30,),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Today',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: TotalDisplay(
                              totalValue: TransactionDB.instance.todayIncome,
                              textColor: Colors.green,
                              titie: 'Income'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 60,
                        width: 3,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: TotalDisplay(
                              totalValue: TransactionDB.instance.todayExpense,
                              textColor: Colors.red,
                              titie: 'Expense'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
