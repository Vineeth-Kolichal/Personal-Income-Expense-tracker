import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/DrawerScreens/Month/month_expense_list.dart';
import 'package:money_management_app/Screens/DrawerScreens/Month/month_income_list.dart';

class ScreenTransactionMonth extends StatefulWidget {
  static const routName = 'transaction_month';
  const ScreenTransactionMonth({Key? key}) : super(key: key);

  @override
  State<ScreenTransactionMonth> createState() => _ScreenTransactionMonthState();
}

class _ScreenTransactionMonthState extends State<ScreenTransactionMonth>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    //CategoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions-This Month'),
      ),
      body: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Color.fromARGB(255, 105, 93, 93),
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Income',
              ),
              Tab(
                text: 'Expences',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MonthIncomeList(),
                MonthExpenseList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
