import 'package:flutter/material.dart';

extension ColorResource on BuildContext {
  ColorScheme get color =>  Theme.of(this).colorScheme;
}
