import 'package:flutter/material.dart';
import 'package:pos_today/widget/pst_text.dart';

class PstOutlineButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool isExpand;
  final double? height, width;
  const PstOutlineButton({
    super.key,
    this.isExpand = false,
    required this.onPressed,
    this.text = "",
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
      ),
      onPressed: onPressed(),
      child: _text(text),
    );
  }

  Widget _text(String text) {
    return PstText(text: text);
  }
}
