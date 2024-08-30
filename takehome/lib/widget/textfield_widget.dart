import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.icon,
    this.errorText,
    required this.textController,
    this.onTap,
    this.onTapTextField,
    this.keyType = true,
  });

  final String? hintText;
  final IconData? icon;
  final String? errorText;
  final TextEditingController textController;
  final Function()? onTap;
  final Function()? onTapTextField;
  final keyType;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextField(
            onTap: () {},
            keyboardType:
                widget.keyType ? TextInputType.text : TextInputType.number,
            controller: widget.textController,
            decoration: InputDecoration(
              errorText: widget.errorText,
              errorStyle: TextStyle(
                fontSize: 14,
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon:
                  IconButton(onPressed: widget.onTap, icon: Icon(widget.icon, color: Colors.green,)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              hintText: widget.hintText,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
