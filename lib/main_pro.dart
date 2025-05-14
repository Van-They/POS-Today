import 'package:flutter/material.dart';
import 'package:pos_today/app.dart';
import 'package:pos_today/core/di/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependency();
  runApp(const AppFlavor(flavorName: "Production"));
}
