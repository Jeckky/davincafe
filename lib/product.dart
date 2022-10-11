import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:davincafe/config/api_url.dart';
import 'package:davincafe/dessert.dart';
import 'package:davincafe/detail.dart';
import 'package:davincafe/drink.dart';
import 'package:davincafe/food.dart';
import 'package:davincafe/network/request-exception.dart';
import 'package:davincafe/provider/local_storage.dart';
import 'package:davincafe/provider/order-handler-provider.dart';
import 'package:davincafe/util/custom-toast.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:provider/provider.dart';
import 'package:davincafe/network/request.dart';

class Product extends StatefulWidget {
  static const routeName = "/product";

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int _selectedIndex = 0;
  bool isLoad = true;
  List allProduct = [];
  List data = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
      } else if (_selectedIndex == 1) {
      } else if (_selectedIndex == 2) {}
    });
  }

  ScrollController scrollController = ScrollController();
  Future<void> fetchBranch() async {
    try {
      data = await getRequest(
        path: API_URL.PRODUCT_URL,
        context: context,
      );
      allProduct = List.from(data);
      // print(allProduct);
      // ('object');
      setState(() {
        isLoad = false;
      });
    } on RequestException catch (e) {
      showCustomToast(
        alertType: "failed",
        context: context,
        message: e.message,
        milli: 3000,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBranch();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('เครื่องดื่ม'),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          Container(
            height: 38,
            child: LayoutBuilder(
              builder: (context, constraints) => ListView(
                scrollDirection: Axis.horizontal,
                //padding: EdgeInsets.all(0),
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: new EdgeInsets.only(right: 0.0),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: Text('Special',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: new EdgeInsets.only(left: 5.0),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: Text('Coffee',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: new EdgeInsets.only(left: 5.0),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: Text('Non-Coffee',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: new EdgeInsets.only(left: 5.0),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: Text('Soft Drink',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: new EdgeInsets.only(left: 5.0),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: Text('Soft Drink',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: new EdgeInsets.only(left: 5.0),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      color: Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: Text('Soft Drink',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Scrollbar(
              interactive: true,
              thumbVisibility: true,
              controller: scrollController,
              radius: Radius.circular(150),
              child: SingleChildScrollView(
                controller: scrollController,
                child: LayoutBuilder(
                  builder: (context, constraints) => ListView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      ...allProduct.map((res) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Detail(),
                              ),
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Detail(),
                                ),
                              );
                            },
                            child: Container(
                              height: 150,
                              padding: EdgeInsets.all(8),
                              margin: new EdgeInsets.only(bottom: 10),
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(10.0),
                                color: Color.fromARGB(159, 68, 67, 67),
                              ),
                              //width: (size.width / 5) - 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: (constraints.maxWidth / 7) + 100,
                                    child: Column(
                                      children: [
                                        Text(
                                          res['productName'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          res['description'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          res['coolPrice'].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Center(
                                        child: Container(
                                          width: constraints.maxWidth * 0.4,
                                          height: constraints.maxWidth * 0.6,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: Colors.white,
                                          ),
                                          child: ImageFade(
                                            image: CachedNetworkImageProvider(
                                              'https://cdn.pixabay.com/photo/2013/08/11/19/46/coffee-171653__480.jpg',
                                              cacheKey: res['id'].toString(),
                                            ),
                                            errorBuilder: (ctx, obj) {
                                              return Image.asset(
                                                  "assets/logo/f.png");
                                            },
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'เครื่องดื่ม',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'อาหาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'ของหวาน',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
