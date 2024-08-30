import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, this.onTap, required this.height, required this.title});
  final Function()? onTap;
  final int height;
  final String title;

  @override
  Widget build(BuildContext context) {
    final double containerHeight = height == 1 ? 50.0 : 75.0;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Color(0xff050834)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
