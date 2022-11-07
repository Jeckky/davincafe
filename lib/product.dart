import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:davincafe/config/api_url.dart';
import 'package:davincafe/dessert.dart';
import 'package:davincafe/detail.dart';
import 'package:davincafe/food.dart';
import 'package:davincafe/network/request-exception.dart';
import 'package:davincafe/util/custom-toast.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:davincafe/network/request.dart';

class Product extends StatefulWidget {
  static const routeName = "/product";

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isLoad = true;
  List allProduct = [];
  List data = [];

  ScrollController scrollController = ScrollController();

  Future<void> fetchProduct() async {
    try {
      data = await getRequest(
        path: API_URL.PRODUCT_URL,
        context: context,
      );
      allProduct = data; //List.from(data);
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
    fetchProduct();
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
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Container(
            height: 38,
            child: LayoutBuilder(
              builder: (context, constraints) => ListView(
                scrollDirection: Axis.horizontal,
                //padding: EdgeInsets.all(0),
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: const Text('Special',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: const Text('Coffee',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: const Text('Non-Coffee',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: const Text('Soft Drink',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: const Text('Soft Drink',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: const Color.fromARGB(159, 207, 109, 28),
                    ),
                    //width: (size.width / 5) - 10,
                    child: const Text('Soft Drink',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Scrollbar(
              interactive: true,
              thumbVisibility: true,
              controller: scrollController,
              radius: const Radius.circular(150),
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
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromARGB(159, 68, 67, 67),
                              ),
                              //width: (size.width / 5) - 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: (constraints.maxWidth / 7) + 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          res['productName'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          res['description'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          res['coolPrice'] != null
                                              ? '฿' +
                                                  res['coolPrice'].toString()
                                              : '',
                                          style: const TextStyle(
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
                                          decoration: const BoxDecoration(
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
    );
  }
}
