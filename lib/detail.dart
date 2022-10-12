import 'dart:ui';

import 'package:davincafe/provider/order-handler-provider.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:image_fade/image_fade.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class Detail extends StatefulWidget {
  static const routeName = "/detail";

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Map cart;
  late Map dish = {'ชื่อ': 'กาแฟ', 'addon': 'เพิ่มความหวาน'};
  TextEditingController msgController = TextEditingController();
  late num dishPrice;

  @override
  void initState() {
    super.initState();

    // dish = widget.dish.deepClone();
    // print(dish);
    dishPrice = 200;

    cart = {
      "cartId": Uuid().v1(),
      "dish": dish,
      "message": "",
      "amount": 1,
      "sumPrice": 100,
    };
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderHandlerProvider>(context);
    final carts = orderProvider.carts;

    // List groupCarts = carts
    //     .map(
    //       (cart) => {
    //         ...cart,
    //         "resName": cart,
    //       },
    //     )
    //     .toList();
    // print(groupCarts.length);
    final groupCartslength = carts.length;
    var size = MediaQuery.of(context).size;
    return Provider<Map>.value(
      value: {
        "cart": cart,
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Caramel Macchiato'),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.green,
                        child: Center(
                          child: Container(
                            width: size.width * 0.6,
                            height: size.width * 0.6,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                            ),
                            child: ImageFade(
                              image: const CachedNetworkImageProvider(
                                'https://cdn.pixabay.com/photo/2013/08/11/19/46/coffee-171653__480.jpg',
                                cacheKey: '1',
                              ),
                              errorBuilder: (ctx, obj) {
                                return Image.asset("assets/logo/f.png");
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text('Caramel Macchiato'),
                            Text('140'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        child: const AutoSizeText(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been ",
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          presetFontSizes: [14, 12],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          // gap between lines
                          children: const <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Colors.yellow,
                              size: 24.0,
                            ),
                            Text('Best Seller'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        child: const AutoSizeText(
                          'Coffee bean selection',
                          presetFontSizes: [16, 14, 12, 10],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 380,
                right: 0.0,
                child: Container(
                  width: 70.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.zero,
                    ),
                    color: Colors.yellow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // ignore: unnecessary_new
                    child: new Text(
                      textAlign: TextAlign.center,
                      'คำสั่งซื้อ  (${groupCartslength.toString()})',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          //width: (size.width / 17) + 5,
          margin: const EdgeInsets.only(bottom: 30.0),
          height: 150.0,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
                // top: BorderSide(color: Colors.grey.shade300, width: 1.0),
                ),
            //borderRadius: new BorderRadius.circular(5.0),
          ),
          //return Provider<Map>.value();
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(159, 207, 109, 28)),
                  onPressed: () {
                    context.read<OrderHandlerProvider>().onAddCart(cart);
                    Navigator.of(context).canPop();
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(8),
                    height: 44.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '฿160',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //
                const SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(159, 128, 127, 126)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(8),
                    height: 44.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          textAlign: TextAlign.center,
                          "Back",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
