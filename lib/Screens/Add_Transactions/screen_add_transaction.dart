import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';

class ScreenAddTrasaction extends StatefulWidget {
  static const routName = 'add_transaction';
  const ScreenAddTrasaction({Key? key}) : super(key: key);

  @override
  State<ScreenAddTrasaction> createState() => _ScreenAddTrasactionState();
}

class _ScreenAddTrasactionState extends State<ScreenAddTrasaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategory;
  CategoryModel? _selectedCategoryModel;
  String? _categoryID;
  final _purposeTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();

  @override
  void initState() {
    _selectedCategory = CategoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add trasaction'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: ListView(
            dragStartBehavior: DragStartBehavior.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _purposeTextEditingController,
                decoration: InputDecoration(
                  labelText: 'Purpose',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 86, 89, 92)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _amountTextEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 86, 89, 92)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 7),
                alignment: Alignment.bottomLeft,
                child: TextButton.icon(
                  onPressed: () async {
                    final _selectDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(
                        Duration(days: 30),
                      ),
                      lastDate: DateTime.now(),
                    );
                    if (_selectDate == null) {
                      return;
                    } else {
                      setState(() {
                        _selectedDate = _selectDate;
                      });
                      print(_selectDate.toString());
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : _selectedDate.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: CategoryType.income,
                    groupValue: _selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory = CategoryType.income;
                        _categoryID = null;
                      });
                    },
                  ),
                  const Text('Income'),
                  Radio(
                    value: CategoryType.expense,
                    groupValue: _selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory = CategoryType.expense;
                        _categoryID = null;
                      });
                    },
                  ),
                  const Text('Expence'),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 17),
                alignment: Alignment.bottomLeft,
                child: DropdownButton(
                  hint: const Text('Select category'),
                  value: _categoryID,
                  items: (_selectedCategory == CategoryType.income
                          ? CategoryDB().incomeCategoryListNotifier
                          : CategoryDB().expenceCategoryListNotifier)
                      .value
                      .map(
                    (e) {
                      return DropdownMenuItem(
                        value: e.id,
                        child: Text(e.name),
                        onTap: () {
                          _selectedCategoryModel = e;
                        },
                      );
                    },
                  ).toList(),
                  onChanged: (selectedValue) {
                    setState(() {
                      _categoryID = selectedValue.toString();
                    });
                    print(selectedValue);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 17),
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  onPressed: () {
                    addTransaction();
                    Navigator.of(context).pop();
                    TransactionDB.instance.refresh();
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addTransaction() async {
    final _purposeText = _purposeTextEditingController.text;
    final _amountText = _amountTextEditingController.text;
    if (_purposeText.isEmpty) {
      return;
    }
    if (_amountText.isEmpty) {
      return;
    }
    if (_categoryID == null) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }
    if (_selectedCategoryModel == null) {
      return;
    }
    final _parseAmount = double.tryParse(_amountText);
    if (_parseAmount == null) {
      return;
    }
    final _model=TransactionModel(
      purpose: _purposeText,
      amount: _parseAmount,
      date: _selectedDate!,
      type: _selectedCategory!,
      category: _selectedCategoryModel!,
    );
    await TransactionDB.instance.addTransaction(_model);
  }
}
