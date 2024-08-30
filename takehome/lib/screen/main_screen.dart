import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:takehome/screen/cart_screen.dart';
import 'package:takehome/screen/storage_product.dart';

import 'home_screen.dart';
import 'create_product_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [HomeScreen(), CreateProductScreen(), StorageProductScreen()],
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.green,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
          items: [
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.house,
                  size: 26,
                ),
                title: const Text('ShopPage'),
                selectedColor: Colors.blue),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.plus,
                  size: 26,
                ),
                title: const Text('Create'),
                selectedColor: Colors.black),
            SalomonBottomBarItem(
                icon: const Icon(
                  FontAwesomeIcons.store,
                  size: 26,
                ),
                title: const Text('Storage'),
                selectedColor: Colors.blue),
          ]),
    );
  }
}
