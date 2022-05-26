import 'package:flutter/material.dart';

import 'customtext.dart';

class CustomBtnSocial extends StatelessWidget {
  final String text ;
  final String imageName ;
  final Function()? onPress;

  const CustomBtnSocial({Key? key, required this.imageName, required this.text, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.shade100
      ),
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: onPress,
          child: Row(
            children: [
              Image.asset(imageName,width: 35.0,height: 35.0,),
              SizedBox(
                height: 70.0,
                width: 30.0,
              ),
              CustomText(
                text: text,
              ),
            ],
          )),
    );
  }
}
