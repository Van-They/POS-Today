import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_today/app.dart';

final navKey = GlobalKey<NavigatorState>();
final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

final routes = GoRouter(
  navigatorKey: navKey,
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (context, state) => MyPager(),
    ),
  ],
);
