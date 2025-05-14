import 'package:flutter/material.dart';
import 'package:pos_today/extension/pst_extension.dart';
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
      body: PstText(text: "text",color: context.color.onSurface,),
    );
  }
}