import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pos_today/extension/pst_extension.dart';
import 'package:pos_today/widget/pst_text.dart';

class PstProduct extends StatelessWidget {
  final String link;
  const PstProduct({required this.link, super.key});

  @override
  Widget build(BuildContext context) {
    return _borderlessStyle(context);
  }

  Widget _borderStyle(BuildContext context) {
    return Card.filled(
      color: context.color.surface,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: context.color.outlineVariant),
        borderRadius: BorderRadius.circular(16.dp),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(link),
              Positioned(
                right: 8.dp,
                top: 8.dp,
                child: CircleAvatar(
                  backgroundColor: context.color.onInverseSurface,
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    size: 18.dp,
                    color: context.color.outline,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.dp,
              right: 8.dp,
              top: 4.dp,
              bottom: 8.dp,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PstText(text: "Product title"),
                    PstText(text: "0.0\$"),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _borderlessStyle(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(link),
              Positioned(
                right: 8.dp,
                top: 8.dp,
                child: Icon(
                  Iconsax.star,
                  size: 18.dp,
                  color: context.color.outline,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.dp,
              right: 8.dp,
              top: 4.dp,
              bottom: 8.dp,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PstText(text: "Product title"),
                    PstText(text: "0.0\$"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
