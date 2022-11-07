import 'package:flutter/material.dart';

class Dessert extends StatefulWidget {
  static const routeName = "/dessert";

  @override
  State<Dessert> createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ของหวาน'),
      ),
      body: Center(child: Text('You have pressed the button  times.')),
    );
  }
}
