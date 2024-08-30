import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:takehome/screen/create_product_screen.dart';

import '../screen/cart_screen.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.child, required this.countAddCart});

  final Widget? child;
  final int countAddCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ShopPage',
                        style: TextStyle(
                            color: Color.fromARGB(255, 11, 143, 79),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(CartScreen.routeName);
                            },
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE7E7E7),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.cartShopping,
                                  color: Color.fromARGB(255, 235, 103, 103),
                                )),
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text('$countAddCart'),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: TextField(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 22),
                        filled: true,
                        fillColor: Color(0xFFE7E7E7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 20)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: child,
          )
        ],
      ),
    );
  }
}
