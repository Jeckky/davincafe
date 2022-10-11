import 'package:davincafe/dessert.dart';
import 'package:davincafe/drink.dart';
import 'package:davincafe/food.dart';
import 'package:davincafe/product.dart';
import 'package:flutter/material.dart';

Route<dynamic>? getAllRoute(RouteSettings settings) {
  switch (settings.name) {
    case Product.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => Product(),
      );
    case Drink.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => Drink(),
      );
    case Food.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => Food(),
      );
    case Dessert.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => Dessert(),
      );
    default:
      return null;
  }
}
