
import 'package:flutter/cupertino.dart';
import 'package:takehome/screen/update_product.dart';

import '../screen/cart_screen.dart';
import '../screen/home_screen.dart';
import '../screen/main_screen.dart';
import '../screen/create_product_screen.dart';

final Map<String, WidgetBuilder> routes = {

  MainScreen.routeName:(context) => const MainScreen(),
  HomeScreen.routeName:(context) => const HomeScreen(),
  CartScreen.routeName:(context) => const CartScreen(),
  CreateProductScreen.routeName:(context) => const CreateProductScreen(),

};