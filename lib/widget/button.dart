import 'package:flutter/material.dart';

class PstOutlineButton extends StatelessWidget {
  const PstOutlineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: () {}, child: Text("outline button"));
  }
}

class PstFilledButton extends StatelessWidget {
  const PstFilledButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: () {}, child: Text("fill button"));
  }
}

class PosTextButton extends StatelessWidget {
  const PosTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text("text button"));
  }
}
