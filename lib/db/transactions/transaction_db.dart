import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';

const TRANSACTION_DB_NAME = 'transaction_db';

abstract class TransactionDbFunctions {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransactions();
  Future<void> deleteTransaction(String id);
}

class TransactionDB implements TransactionDbFunctions {
  String? _cDay;
  String? _cMonth;
  String? _cYear;
  String? lDay;
  String? lMonth;
  String? lYear;
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }
  List<TransactionModel> incomeList = [];
  List<TransactionModel> expenceList = [];
  List<TransactionModel> monthIncomeList = [];
  List<TransactionModel> monthExpenseList = [];
  List<TransactionModel> todayIncomeList = [];
  List<TransactionModel> todayExpenseList = [];

  ValueNotifier<double> allExpense = ValueNotifier(0);
  ValueNotifier<double> allIncome = ValueNotifier(0);
  ValueNotifier<double> monthIncome = ValueNotifier(0);
  ValueNotifier<double> monthExpense = ValueNotifier(0);
  ValueNotifier<double> todayIncome = ValueNotifier(0);
  ValueNotifier<double> todayExpense = ValueNotifier(0);
  ValueNotifier<List<TransactionModel>> transactionListNotifier =
      ValueNotifier([]);

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.id, obj);
  }

  Future<void> refresh() async {
    final _list = await getAllTransactions();
    _list.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(_list);
    transactionListNotifier.notifyListeners();
    allIncomeRefresh();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _db.values.toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.delete(id);
    refresh();
    refreshHome();
    allIncomeRefresh();
    monthExpenseRefresh();
    monthIncomeRefresh();
    todayIncomeRefresh();
  }

  Future<void> refreshHome() async {
    final _allTransactions = await getAllTransactions();
    incomeList.clear();
    expenceList.clear();
    monthIncomeList.clear();
    monthExpenseList.clear();
    todayIncomeList.clear();
    todayExpenseList.clear();
    await Future.forEach(
      _allTransactions,
      (TransactionModel transaction) async {
     
        if (transaction.type == CategoryType.income) {
          incomeList.add(transaction);
          parseCurrentDate();
          parseListDate(transaction.date);
          if (_cMonth == lMonth && _cYear == lYear) {
            monthIncomeList.add(transaction);
            if (_cDay == lDay) {
              todayIncomeList.add(transaction);
            }
          }
        } else {
          expenceList.add(transaction);
          parseCurrentDate();
          parseListDate(transaction.date);
          if (_cMonth == lMonth && _cYear == lYear) {
            monthExpenseList.add(transaction);
            if (_cDay == lDay) {
              todayExpenseList.add(transaction);
            }
          }
        }
      },
    );
    allIncomeRefresh();
    allExpenseRefresh();
    monthExpenseRefresh();
    monthIncomeRefresh();
    todayIncomeRefresh();
    todayExpenseRefresh();
  }

  Future<void> allIncomeRefresh() async {
    allIncome.value = 0;
    for (var i = 0; i < incomeList.length; i++) {
      final _value = incomeList[i];
      allIncome.value = allIncome.value + _value.amount;
    }
    allIncome.notifyListeners();
  }

  Future<void> allExpenseRefresh() async {
    allExpense.value = 0;
    for (var i = 0; i < expenceList.length; i++) {
      final _value = expenceList[i];
      allExpense.value = allExpense.value + _value.amount;
    }
    allExpense.notifyListeners();
  }

  Future<void> monthIncomeRefresh() async {
    monthIncome.value = 0;
    for (var i = 0; i < monthIncomeList.length; i++) {
      final _value = incomeList[i];
      monthIncome.value = monthIncome.value + _value.amount;
    }
    allIncome.notifyListeners();
  }

  void monthExpenseRefresh() {
    monthExpense.value = 0;
    for (var i = 0; i < monthExpenseList.length; i++) {
      final _value = monthExpenseList[i];
      monthExpense.value = monthExpense.value + _value.amount;
    }
    monthExpense.notifyListeners();
  }

  Future<void> todayIncomeRefresh() async {
    todayIncome.value = 0;
    for (var i = 0; i < todayIncomeList.length; i++) {
      final _value = todayIncomeList[i];
      todayIncome.value = todayIncome.value + _value.amount;
    }
    todayIncome.notifyListeners();
  }

  Future<void> todayExpenseRefresh() async {
    todayExpense.value = 0;
    for (var i = 0; i < todayExpenseList.length; i++) {
      final _value = todayExpenseList[i];
      todayExpense.value = todayExpense.value + _value.amount;
    }
    todayExpense.notifyListeners();
  }

  Future<void> parseCurrentDate() async {
    final _date = DateFormat.yMMMd().format(DateTime.now());
    final _splitCurrentDate = _date.split(' ');
    _cDay = _splitCurrentDate[1];
    _cMonth = _splitCurrentDate[0];
    _cYear = _splitCurrentDate[2];
  }

  Future<void> parseListDate(DateTime ldate) async {
    final _ldate = DateFormat.yMMMd().format(ldate);
    final _splitListDate = _ldate.split(' ');
    lDay = _splitListDate[1];
    lMonth = _splitListDate[0];
    lYear = _splitListDate[2];
  }
}
