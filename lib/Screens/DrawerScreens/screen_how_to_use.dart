import 'package:flutter/material.dart';

class ScreenHowToUse extends StatelessWidget {
  static const routName = 'how_to_use';
  const ScreenHowToUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to use?'),
      ),
    );
  }
}
