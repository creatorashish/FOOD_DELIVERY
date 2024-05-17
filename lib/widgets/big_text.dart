import 'package:flutter/material.dart';
import 'package:food_delivery/utlis/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color? color; //reusing text color
  final String text; //reusing text font
  double size; // reuse of text size
  TextOverflow overflow; // text overflow like ..
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto',
          color: color,
          fontSize:
              size == 0 ? Dimensions.font20 : size, // for resturant text size//
          fontWeight: FontWeight.w400),
    );
  }
}
