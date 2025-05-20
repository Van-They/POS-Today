import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: TextButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return TextButton(onPressed: () {}, child: Text("Hello World"));
}
