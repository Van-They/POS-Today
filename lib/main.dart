import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos_today/app.dart';
import 'package:pos_today/core/di/app_module.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  }

  await injectDependency();
  runApp(const AppFlavor(flavorName: "Main"));
}
