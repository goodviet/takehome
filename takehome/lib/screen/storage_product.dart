import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:takehome/screen/update_product.dart';
import 'package:takehome/widget/item_storage_widget.dart';

import '../service/service.app.dart';

class StorageProductScreen extends StatefulWidget {
  const StorageProductScreen({super.key});

  @override
  State<StorageProductScreen> createState() => _StorageProductScreenState();
}

class _StorageProductScreenState extends State<StorageProductScreen> {
  final AppService appService = AppService();

  Future<List<dynamic>> getListData() async {
    return await appService.getAPIProduct();
  }

 getDetail(id) async {
    return await appService.getDetailProduct(id);
  }

  Future<List<dynamic>> deleteProduct(id) async {
    return await appService.deleteProduct(id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Storage Product',
          style: TextStyle(
              color: Color(0xffAB3130),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 80,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        return ItemStorage(
                          updateProduct: () {
                            print(getDetail(listProduct[index]['_id']));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => UpdateProductScreen(
                            //               id: listProduct[index]['_id'],
                            //             )));
                          },
                          onTapFavorite: () {
                            deleteProduct(listProduct[index]['_id']);
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
      ),
    );
  }
}
