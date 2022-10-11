import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:davincafe/util/format-price.dart';
import 'dart:math' as math;

class OrderHandlerProvider extends ChangeNotifier {
  List carts = [];
  Map orderData = {};
  num sumPrice = 0;

  void setOrderData(data) {
    orderData = data;
    sumPrice = 0;
    notifyListeners();
  }

  void onEditCart(Map newCart) {
    int? idx;
    carts.forEachIndexed((index, cart) {
      if (cart['cartId'] == newCart['cartId']) {
        idx = index;
        sumPrice -= cart['sumPrice'];
      }
    });
    if (idx != null) {
      carts[idx!] = newCart;
      sumPrice += newCart['sumPrice'];
    }
    notifyListeners();
  }

  void clearCarts() {
    carts = [];

    notifyListeners();
  }

  num getTotal() {
    return math.max(sumPrice, 0);
  }

  void clearOrder([bool shoudNotify = true]) {
    sumPrice = 0;
    orderData = {};
    carts = [];

    if (shoudNotify) {
      notifyListeners();
    }
  }

  void onRemoveCart(String cartId, num price) {
    carts = carts.where((cart) {
      return cart['cartId'] != cartId;
    }).toList();
    sumPrice -= price;

    notifyListeners();
  }

  void onAddCart(Map cart) {
    carts.add(cart);
    sumPrice += cart['sumPrice'];

    notifyListeners();
  }
}
