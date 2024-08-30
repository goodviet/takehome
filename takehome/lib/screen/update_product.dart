import 'package:flutter/material.dart';
import 'package:takehome/widget/textfield_widget.dart';

import '../service/service.app.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({Key? key, required this.id}) : super(key: key);
  static const String routeName = '/update_product';

  final String? id;

  @override
  _UpdateProductScreenState createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  AppService appService = AppService();
  final _textControllerTitle = TextEditingController();
  final _textControllerPriceOriginal = TextEditingController();
  final _textControllerDescription = TextEditingController();
  final _textControllerPriceDiscounted = TextEditingController();
  final _textControllerDCPercent = TextEditingController();
  final _textControllerImgURL = TextEditingController();

  @override
  void initState() {
    super.initState();
    // You can initialize anything here related to state
  }

  Future<List<dynamic>> getDetail(id) async {
    return await appService.getDetailProduct(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Update Product',
          style: TextStyle(
              color: Color(0xffAB3130),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 80,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Image Product',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Text('Title Product'),
              TextFieldWidget(textController: _textControllerTitle),
              TextFieldWidget(textController: _textControllerPriceDiscounted),
              TextFieldWidget(textController: _textControllerDescription),
              TextFieldWidget(textController: _textControllerPriceOriginal),
              TextFieldWidget(textController: _textControllerDCPercent)
            ],
          ),
        ),
      ),
    );
  }
}
