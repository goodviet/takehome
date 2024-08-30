import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'button_widget.dart';

class ItemStorage extends StatefulWidget {
  const ItemStorage(
      {super.key,
      required this.title,
      required this.priceOriginal,
      required this.description,
      required this.priceDiscounted,
      required this.discountPercentage,
      required this.imgProduct,
      required this.onTapFavorite, this.updateProduct});

  final String title;
  final String description;
  final int priceOriginal;
  final int priceDiscounted;
  final int discountPercentage;
  final String imgProduct;
  final Function()? updateProduct;
  final Function()? onTapFavorite;

  @override
  State<ItemStorage> createState() => _ItemStorageState();
}

class _ItemStorageState extends State<ItemStorage> {
  bool _isFavorite = false; // State to track if the item is favorited

  // void _toggleFavorite() {
  //   setState(() {
  //     _isFavorite = !_isFavorite;
  //   });
  //   // if (widget.onTapFavorite != null) {
  //   //   widget.onTapFavorite!();
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 220,
            decoration: BoxDecoration(
                color: Color(0xffd4e4ed),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 200,
                          width: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              widget.imgProduct,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 10,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              child: Center(
                                child: Text(
                                  '${widget.discountPercentage}%',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  widget.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${widget.priceDiscounted}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    Text(
                                      '\$${widget.priceOriginal}',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.all(10),
                width: 180,
                child: ButtonWidget(
                  height: 1,
                  title: "Update",
                  onTap: widget.updateProduct
                ))),
       Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: widget.onTapFavorite,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.red,
                  size: 35,
                ),
              ),
            ))
      ],
    );
  }
}
