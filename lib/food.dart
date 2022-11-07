import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  static const routeName = "/food";

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('อาหาร'),
      ),
      body: Center(child: Text('You have pressed the button  times.')),
    );
  }
}
