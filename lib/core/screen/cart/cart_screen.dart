import 'package:flutter/material.dart';
import 'package:pos_today/widget/text.dart';
import 'package:pos_today/widget/top_appbar.dart';

const cartRoute ="/cartscreen";

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PstAppbar(
        centerTitle: true,
        title: "Cart",
      ),
      body: PstText(text: "text"),
    );
  }
}