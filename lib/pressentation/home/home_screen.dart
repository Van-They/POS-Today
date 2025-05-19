import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pos_today/extension/pst_extension.dart';
import 'package:pos_today/pressentation/home/home_mock.dart';
import 'package:pos_today/widget/ps_product_promotion.dart';
import 'package:pos_today/widget/pst_product.dart';
import 'package:pos_today/widget/pst_text.dart';

const homeRoute = "/homescreen";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: kToolbarHeight.dp,
            backgroundColor: context.color.primary,
            pinned: true,
            title: Container(
              height: 45.dp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.dp),
                color: context.color.surface,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.dp),
              child: Row(
                children: [
                  Icon(Iconsax.camera, color: context.color.primary),
                  SizedBox(width: 8.dp),
                  PstText(text: "laptop gaming", color: context.color.outline),
                  Spacer(),
                  Icon(Iconsax.search_normal_1, color: context.color.primary),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Card.filled(
              color: context.color.onInverseSurface,
              child: MasonryGridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: imageLinkPromotionMock.length,
                itemBuilder: (context, index) {
                  return PsProductPromotion(
                    link: imageLinkPromotionMock[index],
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(12.dp),
            sliver: SliverAlignedGrid(
              mainAxisSpacing: 4.dp,
              crossAxisSpacing: 4.dp,
              itemCount: imageLinkMMock.length,
              itemBuilder: (context, index) {
                final item = imageLinkMMock[index];
                return PstProduct(link: item);
              },
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ 150.dp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
