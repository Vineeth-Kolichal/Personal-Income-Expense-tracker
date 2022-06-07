import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routName = 'about';
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Personal Income & Expense Tracker",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Version: 1.0',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                '\t\t This is a financial management app. A financial management app is a useful tool to help you drive your personal financial strategy. The most immediate benefit of using a money management app is to help you stick to your budget. It allows you to track your spending and manage your cash flow on a daily basis, helping you move closer to your financial goals.',style: TextStyle(fontSize: 18),),
          ),
        ],
      ),
    );
  }
}
