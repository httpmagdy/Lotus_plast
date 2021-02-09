import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final TextAlign textAlign;
  final double letterSpacing;
  final bool textShadow;
  final bool overflow;
  final bool underline;
  final FW fontW;
  final EdgeInsetsGeometry padding;

  CustomText({
    @required this.text,
    this.color,
    this.fontSize,
    this.textAlign,
    this.letterSpacing,
    this.textShadow = false,
    this.overflow = false,
    // this.toUpperCase = true,
    this.underline = false,
    this.fontW,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          fontFamily: getFontFamily(fontW),
          color: color ?? Colors.black,
          fontWeight: getFontWeight(fontW),
          fontSize: fontSize ?? 11,
          letterSpacing: letterSpacing,
          shadows: [
            textShadow
                ? Shadow(
                    blurRadius: 0.8,
                    color: Colors.black,
                    offset: Offset(1, 1),
                  )
                : null
          ],
          decoration: underline ? TextDecoration.underline : null,
        ),
        overflow: overflow ? TextOverflow.ellipsis : null,
      ),
    );
  }
}

enum FW {
  bold,
  regular,
  light,
  semibold,
}
String getFontFamily(FW fw) {
  if (fw == null) return "cairo_regular";
  switch (fw) {
    case FW.bold:
      return "cairo_bold";
      break;
    case FW.regular:
      return 'cairo_regular';
      break;
    case FW.light:
      return 'cairo_light';
      break;
    case FW.semibold:
      return 'cairo_semibold';
      break;
    default:
      return 'cairo_regular';
  }
}

FontWeight getFontWeight(FW fw) {
  if (fw == null) return FontWeight.w400;
  switch (fw) {
    case FW.bold:
      return FontWeight.bold;
      break;
    case FW.regular:
      return FontWeight.w400;
      break;
    case FW.light:
      return FontWeight.w300;
      break;
    case FW.semibold:
      return FontWeight.w600;
      break;
    default:
      return FontWeight.w400;
  }
}
