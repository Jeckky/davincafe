import 'package:flutter/material.dart';

class Drink extends StatefulWidget {
  static const routeName = "/drink";

  @override
  State<Drink> createState() => _DrinkState();
}

class _DrinkState extends State<Drink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เครื่องดื่ม'),
      ),
      body: Center(child: Text('You have pressed the button  times.')),
    );
  }
}
