import 'package:flutter/material.dart';
import '../../constants.dart';

class MenusButton extends StatelessWidget{
  final IconData icon;
  final VoidCallback onTap;

  const MenusButton({
    Key? key,
    required this.onTap,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.width*0.04,
        width: size.width*0.04,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(4)
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: size.width*0.04,
        ),
      ),
    );
  }

}