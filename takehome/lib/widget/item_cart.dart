import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemCartWidget extends StatefulWidget {
  const ItemCartWidget({super.key, required this.imgProduct, required this.priceDiscounted, required this.title});

    final String? imgProduct;
    final int? priceDiscounted;
    final String? title;

  @override
  State<ItemCartWidget> createState() => _ItemCartWidgetState();
}

class _ItemCartWidgetState extends State<ItemCartWidget> {
  int countProduct = 1;

  void _incrementCounter() {
    setState(() {
      countProduct++;
    });
  }

  void _descrementCounter() {
    setState(() {
      if (countProduct > 1) {
        countProduct--;
      }
      {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 150,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 242, 238, 238).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          // border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.imgProduct!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                           
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.5, color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              FontAwesomeIcons.trashCan,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                    // Container(
                    //   child: Text(
                    //     "Smart Phone",
                    //     textAlign: TextAlign.left,
                    //     style: TextStyle(color: Colors.grey, fontSize: 18),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                         '\$${widget.priceDiscounted}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () {
                                        _descrementCounter();
                                      },
                                      child: Container(
                                        height: 35,
                                    
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          

                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                          child: Center(child: Text('-', style: TextStyle(
                                            fontSize: 29
                                          ),))))),
                              Expanded(
                                  flex: 1,
                                  child: Center(child: Text('$countProduct'))),
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                      onTap: () {
                                        _incrementCounter();
                                      },
                                      child: Container(
                                         height: 35,
                                    
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.green,
                                          

                                          ),
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(child: Text('+', style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 22
                                        ),)))))
                            ],
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
