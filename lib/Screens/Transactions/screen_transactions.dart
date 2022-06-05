import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';
double total_amount=0;
class ScreenTransactions extends StatelessWidget {
  //double total_amount=0;
  ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return ListView.separated(
          padding: EdgeInsets.all(10),
          itemBuilder: (ctx, index) {
            final _value = newList[index];
            return Slidable(
              key: Key(_value.id!),
              startActionPane: ActionPane(
                motion: DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) {
                      TransactionDB.instance.deleteTransaction(_value.id!);
                    },
                    icon: Icons.delete,
                    label: 'Delete',
                  )
                ],
              ),
              child: Card(
                elevation: 0,
                child: ListTile(
                  trailing: Text(_value.purpose),
                  leading: CircleAvatar(
                    backgroundColor: _value.type == CategoryType.income
                        ? Colors.green
                        : Colors.red,
                    radius: 50,
                    child: Text(
                      parseDate(_value.date),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  title: Text('₹ ${_value.amount}'),
                  subtitle: Text(_value.category.name),
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: newList.length,
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
