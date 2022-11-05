import 'package:app_dgp/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArrowButton extends StatelessWidget{
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final String tooltip;

  ArrowButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = kPrimaryColor,
    required this.tooltip
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Transform.scale(
          scale: 1.5,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child:  FloatingActionButton(
                onPressed: onPressed,
                tooltip: tooltip,
                backgroundColor: kPrimaryColor,
                child: Transform.scale(
                  scale: 2,
                  child: Icon(icon),
                )
            ),
          ),
      );
  }

}