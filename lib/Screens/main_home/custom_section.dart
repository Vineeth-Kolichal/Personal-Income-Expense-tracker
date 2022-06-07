import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/Screens/main_home/total_display.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';

class CustomSection extends StatefulWidget {
  const CustomSection({Key? key}) : super(key: key);

  @override
  State<CustomSection> createState() => _CustomSectionState();
}

class _CustomSectionState extends State<CustomSection> {
  DateTime? _startDate;
  DateTime? _endDate;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Custom',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      final _selectStartDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(
                          Duration(days: 365),
                        ),
                        lastDate: DateTime.now(),
                      );
                      if (_selectStartDate == null) {
                        return;
                      } else {
                        setState(() {
                          _startDate = _selectStartDate;
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month),
                    label: Text(_startDate == null
                        ? 'Start'
                        : DateFormat.yMMMd().format(_startDate!),
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 72, 71, 71),
                    ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      final _selectEndDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(
                          Duration(days: 365),
                        ),
                        lastDate: DateTime.now(),
                      );
                      if (_selectEndDate == null) {
                        return;
                      } else {
                        setState(() {
                          _endDate = _selectEndDate;
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month),
                    label: Text(
                      _endDate == null
                        ? 'End'
                        : DateFormat.yMMMd().format(_endDate!),
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 72, 71, 71),
                    ),
                    
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if(_endDate!=null || _startDate!=null){
                      TransactionDB.instance.customDate(_startDate!, _endDate!);
                      }
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TotalDisplay(
                        totalValue: TransactionDB.instance.customIncome,
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
                        totalValue: TransactionDB.instance.customExpense,
                        textColor: Colors.red,
                        titie: 'Expense'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
