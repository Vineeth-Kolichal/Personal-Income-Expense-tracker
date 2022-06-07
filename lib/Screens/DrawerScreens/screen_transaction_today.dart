import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/DrawerScreens/Day/day_expense_list.dart';
import 'package:money_management_app/Screens/DrawerScreens/Day/day_income_list.dart';

class ScreenTransactionDay extends StatefulWidget {
  static const routName = 'transaction_today';
  const ScreenTransactionDay({Key? key}) : super(key: key);

  @override
  State<ScreenTransactionDay> createState() => _ScreenTransactionDayState();
}

class _ScreenTransactionDayState extends State<ScreenTransactionDay>
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
        title: Text('Transactions-Today'),
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
                DayIncomeList(),
                DayExpenseList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
