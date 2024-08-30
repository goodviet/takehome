import 'package:flutter/material.dart';

import 'button_widget.dart';


class SuccessfullyDialog {
  static void showMyDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(
            Icons.check,
            color: Colors.green[400],
            size: 50,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          title: Text(
            title,
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
          actions: [
            ButtonWidget(
              height: 2,
              title: 'Đóng',
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );

  }
}
