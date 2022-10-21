import 'package:flutter/material.dart';
import '../constants.dart';

class TextContainer extends StatelessWidget {
  final Widget child;
  const TextContainer({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.95,
      height: size.height*0.15,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
          border: Border.all(
            color: kPrimaryColor,
            width: 4,
          ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}