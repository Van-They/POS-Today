import 'package:flutter/material.dart';
import 'package:pos_today/core/route/app_route.dart';
import 'package:pos_today/extension/pst_extension.dart';
import 'package:pos_today/theme/theme.dart';
import 'package:pos_today/widget/pst_top_appbar.dart';

class AppFlavor extends StatelessWidget {
  final String flavorName;
  const AppFlavor({super.key, this.flavorName = 'Flavor Name'});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      theme: lightTheme,
      scaffoldMessengerKey: scaffoldKey,
      scrollBehavior: ScrollBehavior().copyWith(
        physics: BouncingScrollPhysics(),
      ),
      routerConfig: routes,
    );
  }
}

class MyPager extends StatelessWidget {
  const MyPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PstTopAppbar(),
      body: Center(
        child: Text('Test', style: TextStyle(color: context.color.primary)),
      ),
    );
  }
}
