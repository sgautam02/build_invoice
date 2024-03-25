import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final FontStyle? fontStyle;
  final double? lineSpace;
  TextOverflow? overflow;

  SmallText({
    super.key,
    required this.text,
    this.fontSize=12.0,
    this.fontWeight,
    this.color,
    this.fontStyle,
    this.overflow,
    this.lineSpace
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          height: lineSpace
      ),
      overflow:overflow ,
    );
  }
}
