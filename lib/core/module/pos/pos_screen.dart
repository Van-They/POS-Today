import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pos_today/core/utils/pst_extension.dart';

const posRoute = "/posscreen";

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            title: Text("Order"),
            leading: IconButton(
              style: IconButton.styleFrom(backgroundColor: context.color.onSurface),
              onPressed: () {},
              icon: Icon(Iconsax.menu),
            ),
            actions: [
              IconButton(
                style: IconButton.styleFrom(backgroundColor: context.color.onSurface),
                onPressed: () {},
                icon: Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
