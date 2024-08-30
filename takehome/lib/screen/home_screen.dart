import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:takehome/model/product.class.dart';
import 'package:takehome/service/service.app.dart';
import '../model/cart.class.dart';
import '../widget/item_product_cart.dart';
import '../widget/app_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppService appService = AppService();

  Future<List<dynamic>> getListData() async {
    return await appService.getAPIProduct();
  }

  int countAddCart = 0;
  void _setAddToCart() {
    setState(() {
      countAddCart++;
      if (countAddCart >= 9) {
        countAddCart = 9;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      countAddCart: countAddCart,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 200,
              decoration: BoxDecoration(
                // color: Color(0xff2ba84a),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.tgdd.vn/Files/2023/10/27/1553292/flex3-271023-224229-800-resize.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      child: const Text(
                        'Up to 50%',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
              ],
            ),
            FutureBuilder<List<dynamic>>(
              future: getListData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No products found'));
                } else {
                  final listProduct = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listProduct.length,
                    itemBuilder: (context, index) {
                      return ItemProductCart(
                        onTapFavorite: () {
                          _setAddToCart();
                          // Provider.of<Cart>(context, listen: false).addItem(
                          //   listProduct[index]['_id'],
                          //   listProduct[index]['title'],
                          //   listProduct[index]['imgProduct'],
                          //   int.tryParse(listProduct[index]['priceOriginal']
                          //           .toString()) ??
                          //       0,
                          // );
                        },
                        title: listProduct[index]['title'],
                        priceOriginal: int.tryParse(listProduct[index]
                                    ['priceOriginal']
                                .toString()) ??
                            0,
                        description: listProduct[index]['description'],
                        priceDiscounted: int.tryParse(listProduct[index]
                                    ['priceDiscounted']
                                .toString()) ??
                            0,
                        discountPercentage: int.tryParse(listProduct[index]
                                    ['discountPercentage']
                                .toString()) ??
                            0,
                        imgProduct: listProduct[index]['imgProduct'],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
