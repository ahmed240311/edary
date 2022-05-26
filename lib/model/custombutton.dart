import 'package:flutter/material.dart';

import 'customtext.dart';
class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final Function()? onPress;

  const CustomButton({Key? key, required this.buttonText, this.onPress,  required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   FlatButton(

        padding: EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        onPressed: onPress,
        color: color,
        child: CustomText(

          text: buttonText,
          color: Colors.white,
          alignment: Alignment.center,
          fontSize: 20.0,
        ));
  }
}
