import 'package:flutter/material.dart';


enum ButtonType {
  small,
  med,
  large,
}


class CustomButton extends StatelessWidget {

  const CustomButton(
      {super.key, required this.buttonType, this.onTap, required this.text,});

  final ButtonType buttonType;
  final Function()? onTap;
  final String text;

  handleButtonType() {
    switch (buttonType) {
      case ButtonType.small:
      // TODO: Handle this case.
      //   throw UnimplementedError();
      case ButtonType.med:
      // TODO: Handle this case.
        throw UnimplementedError();
      case ButtonType.large:
      // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 50),

        backgroundColor:Colors.deepPurple ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
      ),
      onPressed: onTap,
      child: Text(text, style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),),

    )
    ;
  }
}
