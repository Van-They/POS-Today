import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

Future<Database> initDatabase() async {
  //test on web
  if (kIsWeb) {
    final path = "psa_database.db";
    var factory = databaseFactoryFfiWeb;
    return await factory.openDatabase(path);
  }
  //mobile platform
  final path = await getDatabasesPath();
  final databasePath = "$path/psa_database.db";
  return await openDatabase(
    databasePath,
    version: 1,
    onCreate: (db, version) {
      // Create tables
    },
  );
}
