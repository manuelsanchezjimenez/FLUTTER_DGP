import 'package:app_dgp/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButtonPicto extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Color color, textColor;
  final Image picto;
  final double width;
  final double height;

  RoundButtonPicto({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = kPrimaryWhite,
    required this.width,
    required this.height,
    required this.picto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width,
      height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            color: color,
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  Text(
                    text,
                    style: GoogleFonts.lexend(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Transform.scale(
                     scale: 1.2,
                     child: picto,
                   )
              ]
            )
          ),
        ),
    );
  }

}