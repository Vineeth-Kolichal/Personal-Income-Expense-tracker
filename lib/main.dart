import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/Screens/Add_Transactions/screen_add_transaction.dart';
import 'package:money_management_app/Screens/DrawerScreens/about_page.dart';
import 'package:money_management_app/Screens/DrawerScreens/screen_how_to_use.dart';
import 'package:money_management_app/Screens/DrawerScreens/screen_transaction_month.dart';
import 'package:money_management_app/Screens/DrawerScreens/screen_transaction_today.dart';
import 'package:money_management_app/Screens/Home/screen_home.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Column(
            children: [
              Image.asset(
                'assets/images/income_expence.png',
                height: 70,
                width: 210,
              ),
              //Text('Income & Expense Tracker.',style: TextStyle(color: Color.fromARGB(255, 71, 9, 1),fontSize: 22,fontWeight: FontWeight.bold),),
            ],
          ),
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Color.fromARGB(255, 245, 245, 242)),
      routes: {
        ScreenAddTrasaction.routName: (ctx) => const ScreenAddTrasaction(),
        ScreenTransactionDay.routName: (ctx) => const ScreenTransactionDay(),
        ScreenTransactionMonth.routName: (ctx) =>
            const ScreenTransactionMonth(),
        AboutPage.routName: (ctx) => const AboutPage(),
        ScreenHowToUse.routName:(ctx) => const ScreenHowToUse(),
      },
    );
  }
}
