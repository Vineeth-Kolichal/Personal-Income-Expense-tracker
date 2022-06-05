import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management_app/Screens/Transactions/screen_transactions.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';

class TotalDisplay extends StatelessWidget {
  final ValueNotifier<double> totalValue;
  final Color textColor;
  final String titie;
  TotalDisplay(
      {Key? key,
      required this.totalValue,
      required this.textColor,
      required this.titie})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$titie:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        ValueListenableBuilder(
          valueListenable: totalValue,
          builder: (BuildContext ctx, double all, Widget? _) {
            return Text(
              '₹ ${all}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
