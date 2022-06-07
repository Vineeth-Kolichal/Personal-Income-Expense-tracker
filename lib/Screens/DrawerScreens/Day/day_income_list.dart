import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';

class DayIncomeList extends StatelessWidget {
  const DayIncomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.dayIncomeTransactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newlist, Widget? _) {
        return ListView.separated(
          itemBuilder: ((ctx, index) {
            final _value = newlist[index];
            return Card(
              color: Color.fromARGB(255, 225, 245, 226),
              child: ListTile(
                // leading: CircleAvatar(
                //   backgroundColor: Colors.green[200],
                //   radius: 50,
                //   child: Text(
                //     parseDate(_value.date),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                title: Text(_value.purpose,style: TextStyle(fontSize: 20),),
                subtitle: Text(_value.category.name),
                trailing: Text(
                  '₹ ${_value.amount}',
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 65, 4),
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
