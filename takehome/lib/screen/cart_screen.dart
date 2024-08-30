import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takehome/widget/button_widget.dart';
import 'package:takehome/widget/item_cart.dart';

import '../model/cart.class.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const String routeName = '/cart_screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: const Text(
          "My Cart",
          style: TextStyle(
              color: Color(0xffAB3130),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Đảm bảo Stack chiếm toàn bộ chiều cao của màn hình
          Positioned.fill(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ItemCartWidget(
                        imgProduct:
                            'https://images.samsung.com/vn/smartphones/galaxy-z-flip6/images/galaxy-z-flip6-share-image.jpg',
                        priceDiscounted: 887,
                        title: 'Samsung Z')
                    // ListView.builder(
                    //     itemCount: cart.items.length,
                    //     itemBuilder: (context, index) {
                    //       ItemCartWidget(
                    //           imgProduct:
                    //               cart.items.values.toList()[index].imgProduct,
                    //           priceDiscounted: cart.items.values
                    //               .toList()[index]
                    //               .priceDiscounted,
                    //           title: cart.items.values.toList()[index].title);
                    //     })
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.all(20),
                height: 180,
                decoration: BoxDecoration(
                    color: Color(0xff8da9c4),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$299.00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    ButtonWidget(
                      height: 2,
                      title: 'Buy now',
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
