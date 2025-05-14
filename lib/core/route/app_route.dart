import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_today/pressentation/cart/cart_screen.dart';
import 'package:pos_today/pressentation/home/home_screen.dart';
import 'package:pos_today/pressentation/main/main_screen.dart';
import 'package:pos_today/pressentation/select_language/select_language_screen.dart';

final navKey = GlobalKey<NavigatorState>();
final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

CustomTransitionPage<dynamic> _customPageTransition(
  Widget page,
  ValueKey<String> pageKey,
) {
  return CustomTransitionPage(
    child: page,
    key: pageKey,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

final routes = GoRouter(
  navigatorKey: navKey,
  initialLocation: languageRoute,
  routes: <RouteBase>[
    GoRoute(
      path: languageRoute,
      builder: (context, state) => SelectLanguageScreen(),
    ),
    GoRoute(path: homeRoute, builder: (context, state) => HomeScreen()),
    GoRoute(path: cartRoute, builder: (context, state) => CartScreen()),
    //bottom navigation
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              MainScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: TopLevelRoute.home.routeName,
              pageBuilder:
                  (context, state) =>
                      _customPageTransition(HomeScreen(), state.pageKey),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: TopLevelRoute.cart.routeName,
              pageBuilder:
                  (context, state) =>
                      _customPageTransition(CartScreen(), state.pageKey),
            ),
          ],
        ),
      ],
    ),
  ],
);
