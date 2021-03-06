import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/Home/screen_home.dart';

class MoneyBottomNavigation extends StatelessWidget {
  const MoneyBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomeScreen.selectIndexNotifier,
      builder: (BuildContext ctx, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 44, 8, 191),
          unselectedItemColor: Colors.grey,
          currentIndex: updatedIndex,
          onTap: (newIndex) {
            HomeScreen.selectIndexNotifier.value = newIndex;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_rupee),
              label: 'Transactios',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
          ],
        );
      },
    );
  }
}
