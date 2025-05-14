import 'package:get_it/get_it.dart';
import 'package:pos_today/core/utils/language_manager.dart';
import 'package:pos_today/data/database/pst_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final di = GetIt.instance;

Future<void> injectDependency() async {
  di.registerSingletonAsync<Database>(() async {
    return await initDatabase();
  });

  // shared preference
  di.registerSingleton<SharedPreferencesAsync>(SharedPreferencesAsync());

  //string resources
  final languageManager = await LanguageManager.initialize(
    sharedPref: di.get<SharedPreferencesAsync>(),
  );
  di.registerSingleton<LanguageManager>(languageManager);
}
