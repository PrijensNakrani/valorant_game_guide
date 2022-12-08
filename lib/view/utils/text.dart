import 'package:flutter/material.dart';

class Ts extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final double? height;
  final double? latterSpace;
  final double? wordSpace;
  final TextOverflow? overFlow;
  final int? maxLine;
  final family;
  final TextAlign? textAlign;
  const Ts(
      {Key? key,
      required this.text,
      this.size = 15,
      this.color,
      this.weight,
      this.height,
      this.latterSpace,
      this.wordSpace,
      this.overFlow,
      this.maxLine,
      this.textAlign,
      this.family = 'Valorant'});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: overFlow,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: family,
        wordSpacing: wordSpace,
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      ),
    );
  }
}
