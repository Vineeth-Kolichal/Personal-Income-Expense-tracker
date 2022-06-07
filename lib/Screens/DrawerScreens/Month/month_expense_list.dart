import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';

class MonthExpenseList extends StatelessWidget {
  const MonthExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          TransactionDB.instance.monthExpenseTransactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newlist, Widget? _) {
        return ListView.separated(
          itemBuilder: ((ctx, index) {
            final _value = newlist[index];
            return Card(
              color: Color.fromARGB(255, 247, 207, 205),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 241, 103, 103),
                  radius: 50,
                  child: Text(
                    parseDate(_value.date),
                    textAlign: TextAlign.center,
                  ),
                ),
                title: Text(
                  _value.purpose,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(_value.category.name),
                trailing: Text(
                  '₹ ${_value.amount}',
                  style: TextStyle(
                    color: Color.fromARGB(255, 112, 1, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
          separatorBuilder: (ctx, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: newlist.length,
        );
      },
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitedDate = _date.split(' ');
    return '${_splitedDate.last}\n${_splitedDate.first}';
  }
}
