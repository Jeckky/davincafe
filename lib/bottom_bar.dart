import 'package:davincafe/dessert.dart';
import 'package:davincafe/drink.dart';
import 'package:davincafe/food.dart';
import 'package:davincafe/product.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    // const Text('Home'),
    Product(),
    //const Text('Search'),
    Food(),
    //const Text('Tickets'),
    Drink(),
    // const Text('Profile')
    Dessert()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My tickets'),
      // ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526480),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_drink_filled),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_drink_filled),
              label: "เครื่องดื่ม"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_food_filled),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_food_filled),
              label: "อาหาร"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: "ของหวาน"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Profile"),
        ],
      ),
    );
  }
}
