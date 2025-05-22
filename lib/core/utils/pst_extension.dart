import 'package:flutter/material.dart';
import 'package:pos_today/core/utils/device_size.dart';

extension ColorResource on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
}

extension ScaleDouble on double {
  double get dp => DeviceSize.instance.calculateSize(this);
}

extension ScaleInt on int {
  double get dp => DeviceSize.instance.calculateSize(toDouble());
}
