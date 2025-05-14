import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_today/extension/pst_extension.dart';

const mainRoute = "/mainscreen";

enum TopLevelRoute {
  home("/toplevelhome"),
  cart("/toplevelcart");

  final String routeName;
  const TopLevelRoute(this.routeName);
}

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({required this.navigationShell, super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.color.onPrimary,
        selectedItemColor: context.color.onSurface,
        unselectedItemColor: context.color.outline,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Cart',
          ),
        ],
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (value) => widget.navigationShell.goBranch(value),
      ),
    );
  }
}
