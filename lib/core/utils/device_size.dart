import 'package:flutter/material.dart';

class DeviceSize {
  DeviceSize._();

  static DeviceSize instance = DeviceSize._();

  // width and height device
  Size get size =>
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;

  // device pixel ratio
  double get deviceRatio =>
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

  // physical device width
  double get physicalWidth => size.width;

  // physical device height
  double get physicalHeight => size.height;

  // screen width
  double get screenWidth => physicalWidth / deviceRatio;

  // screen height
  double get screenHeight => physicalHeight / deviceRatio;

  double calculateSize(double size,[int baseWidth = 375]) {
    final dimension = screenWidth < screenHeight ? screenWidth : screenHeight;
    final originalScale = dimension / baseWidth * size;
    return (size + (originalScale - size) * 0.5);
  }
}
