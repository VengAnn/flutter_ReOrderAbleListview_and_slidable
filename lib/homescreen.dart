import 'package:flutter/material.dart';
import 'appdetail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn More about ReOrderAble Listview'),
      ),
      //
      body: AppDetail(),
    );
  }
}
