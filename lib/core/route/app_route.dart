import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_today/core/module/pos/pos_screen.dart';
import 'package:pos_today/core/screen/cart/cart_screen.dart';
import 'package:pos_today/core/screen/home/home_content_fragment.dart';
import 'package:pos_today/core/screen/home/home_screen.dart';
import 'package:pos_today/core/screen/main/main_screen.dart';
import 'package:pos_today/core/screen/profile/profile_screen.dart';
import 'package:pos_today/core/screen/select_language/select_language_screen.dart';
import 'package:pos_today/core/screen/wishlist/wishlist_screen.dart';

final _rootNavKey = GlobalKey<NavigatorState>(debugLabel: "root");
final _bottomNavKey = GlobalKey<StatefulNavigationShellState>(
  debugLabel: "bottom nav key",
);
final _tabNavKey = GlobalKey<StatefulNavigationShellState>(
  debugLabel: "tab key",
);
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
  navigatorKey: _rootNavKey,
  initialLocation: posRoute,
  routes: <RouteBase>[

    //pos screen
    GoRoute(
      path: posRoute,
      builder: (context, state) => PosScreen(),
    ),

    GoRoute(
      path: languageRoute,
      builder: (context, state) => SelectLanguageScreen(),
    ),
    GoRoute(path: homeRoute, builder: (context, state) => HomeScreen()),
    GoRoute(path: cartRoute, builder: (context, state) => CartScreen()),
    GoRoute(path: wishlistRoute, builder: (context, state) => WishlistScreen()),
    GoRoute(path: profileRoute, builder: (context, state) => ProfileScreen()),
    //bottom navigation
    StatefulShellRoute.indexedStack(
      key: _bottomNavKey,
      builder:
          (context, state, navigationShell) =>
              MainScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          initialLocation: homeContentRoute,
          routes: [
            StatefulShellRoute.indexedStack(
              key: _tabNavKey,
              builder: (context, state, navigationShell) => HomeScreen(),
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: homeContentRoute,
                      pageBuilder:
                          (context, state) => _customPageTransition(
                            HomeContentFragment(),
                            state.pageKey,
                          ),
                    ),
                  ],
                ),
              ],
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
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: TopLevelRoute.wishlist.routeName,
              pageBuilder:
                  (context, state) =>
                      _customPageTransition(WishlistScreen(), state.pageKey),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: TopLevelRoute.profile.routeName,
              pageBuilder:
                  (context, state) =>
                      _customPageTransition(ProfileScreen(), state.pageKey),
            ),
          ],
        ),
      ],
    ),
  ],
);
