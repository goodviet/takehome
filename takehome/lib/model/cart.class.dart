import 'package:flutter/material.dart';

import 'product.class.dart';

class Cart with ChangeNotifier {
  Map<String, Product> _items = {};

  Map<String, Product> get items {
    return {..._items};
  }

  void addItem(
      String productId, String title, String imgProduct, int? priceDiscounted ) {
    if (_items.containsKey(productId)) {
    } else {
      _items.putIfAbsent(
        productId,
        () => Product(
            sId: productId,
            title: title,
            imgProduct: imgProduct,
            priceDiscounted: priceDiscounted),
      );
    }
    notifyListeners();
  }
}
