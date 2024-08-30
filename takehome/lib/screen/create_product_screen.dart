import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:takehome/service/service.app.dart';
import 'package:takehome/widget/show_dialog.dart';
import 'package:takehome/widget/textfield_widget.dart';

import '../widget/button_widget.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});
  static const String routeName = '/create_product_screen';

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  AppService appService = AppService();
  final _textControllerTitle = TextEditingController();
  final _textControllerPriceOriginal = TextEditingController();
  final _textControllerDescription = TextEditingController();
  final _textControllerPriceDiscounted = TextEditingController();
  final _textControllerDCPercent = TextEditingController();
  final _textControllerImgURL = TextEditingController();

  postRequestDataCreateProduct() {
    String title = _textControllerTitle.text;
    String description = _textControllerDescription.text;
    int priceOriginal = int.parse(_textControllerPriceOriginal.text);
    int priceDiscounted = int.parse(_textControllerPriceDiscounted.text);
    int dcPercent = int.parse(_textControllerDCPercent.text);
    String imgURL = _textControllerImgURL.text;

    var data = {
      'title': title,
      'description': description,
      'priceOriginal': priceOriginal,
      'priceDiscounted': priceDiscounted,
      'discountPercentage': dcPercent,
      'imgProduct': imgURL,
    };
    getDataCreateProduct(data);
  }

  getDataCreateProduct(data) {
    this.appService.postCreateProduct(data).then((response) {
      if (response.statusCode == 200) {
        SuccessfullyDialog.showMyDialog(context, 'Successful Create', 'You have successfully created a new product.');
      } else {
        print(response.body);
      }
    }).catchError((Error) {
      throw Exception(Error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: const Text(
          "Create Product",
          style: TextStyle(
              color: Color(0xffAB3130),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldWidget(
                  icon: FontAwesomeIcons.pencil,
                  hintText: 'Title Product',
                  textController: _textControllerTitle),
              TextFieldWidget(
                  icon: FontAwesomeIcons.moneyBill,
                  hintText: 'Price Original',
                  textController: _textControllerPriceOriginal),
              TextFieldWidget(
                  icon: FontAwesomeIcons.newspaper,
                  hintText: 'Description',
                  textController: _textControllerDescription),
              TextFieldWidget(
                  icon: FontAwesomeIcons.tag,
                  hintText: 'Price Discounted',
                  textController: _textControllerPriceDiscounted),
              TextFieldWidget(
                  icon: FontAwesomeIcons.percent,
                  hintText: 'Discount Percentage',
                  textController: _textControllerDCPercent),
              TextFieldWidget(
                  icon: FontAwesomeIcons.image,
                  hintText: 'Image URL',
                  textController: _textControllerImgURL),
              ButtonWidget(
                height: 2,
                title: "Create",
                onTap: () {
                  postRequestDataCreateProduct();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
