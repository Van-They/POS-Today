import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_today/core/route/app_route.dart';
import 'package:pos_today/theme/theme.dart';

import 'core/screen/cubit/setting_cubit.dart';

class AppFlavor extends StatelessWidget {
  final String flavorName;

  const AppFlavor({super.key, this.flavorName = 'Flavor Name'});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SettingCubit())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        darkTheme: darkTheme,
        theme: darkTheme,
        scaffoldMessengerKey: scaffoldKey,
        scrollBehavior: ScrollBehavior().copyWith(
          physics: BouncingScrollPhysics(),
        ),
        routerConfig: routes,
      ),
    );
  }
}
