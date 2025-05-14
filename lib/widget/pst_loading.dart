import 'package:flutter/material.dart';

class PstLoading extends StatelessWidget {
  const PstLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
