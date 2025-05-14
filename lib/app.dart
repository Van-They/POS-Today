import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_today/core/route/app_route.dart';
import 'package:pos_today/pressentation/cubit/setting_cubit.dart';
import 'package:pos_today/theme/theme.dart';

class AppFlavor extends StatelessWidget {
  final String flavorName;

  const AppFlavor({super.key, this.flavorName = 'Flavor Name'});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SettingCubit())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: darkTheme,
        theme: lightTheme,
        scaffoldMessengerKey: scaffoldKey,
        scrollBehavior: ScrollBehavior().copyWith(
          physics: BouncingScrollPhysics(),
        ),
        routerConfig: routes,
      ),
    );
  }
}
