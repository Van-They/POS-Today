import 'package:flutter/material.dart';
import 'package:pos_today/core/utils/pst_extension.dart';
import 'package:pos_today/widget/text.dart';

class PsProductPromotion extends StatelessWidget {
  final String link;
  const PsProductPromotion({required this.link, super.key});

  @override
  Widget build(BuildContext context) {
    return _borderlessStyle(context);
  }

  Widget _borderlessStyle(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(link),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.dp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PstText(
                  text: "1,000\$",
                  decoration: TextDecoration.lineThrough,
                  color: context.color.outlineVariant,
                ),
                PstText(text: "799.9\$",color: context.color.error,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
