import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/Category/expence_category_list.dart';
import 'package:money_management_app/Screens/Category/income_category_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Color.fromARGB(255, 105, 93, 93),
          controller: _tabController,
          tabs: [
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
              IncomeCategoryList(),
              ExpenceCategoryList(),
            ],
          ),
        ),
      ],
    );
  }
}
