import 'package:flutter/material.dart';
import 'package:pos_today/extension/pst_extension.dart';

class PstText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color? color;
  const PstText({
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight = FontWeight.normal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 14.dp,
        fontWeight: fontWeight,
        color: color ?? context.color.onSurface,
      ),
    );
  }
}
