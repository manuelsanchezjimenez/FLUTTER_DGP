import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/textContainer.dart';

class TextInputRound extends StatelessWidget{
  final String hintText;
  final ValueChanged<String> onChanged;
  const TextInputRound({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextContainer(
          child: TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                border: InputBorder.none,

            ),
          ),
        )
    );
  }
}