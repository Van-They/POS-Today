import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pos_today/extension/pst_extension.dart';

const mainRoute = "/mainroute";

enum TopLevelRoute {
  home("/toplevelhome"),
  cart("/toplevelcart"),
  wishlist("/toplevelwishlist"),
  profile("/toplevelprofile");

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
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: context.color.primaryContainer,
        indicatorColor: context.color.primary,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Iconsax.home,
              size: 24.dp,
              color:
                  widget.navigationShell.currentIndex == 0
                      ? context.color.onPrimary
                      : null,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Iconsax.shopping_cart,
              size: 24.dp,
              color:
                  widget.navigationShell.currentIndex == 1
                      ? context.color.onPrimary
                      : null,
            ),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(
              Iconsax.star,
              size: 24.dp,
              color:
                  widget.navigationShell.currentIndex == 2
                      ? context.color.onPrimary
                      : null,
            ),
            label: 'Wishlist',
          ),
          NavigationDestination(
            icon: Icon(
              Iconsax.user,
              size: 24.dp,
              color:
                  widget.navigationShell.currentIndex == 3
                      ? context.color.onPrimary
                      : null,
            ),
            label: 'Me',
          ),
        ],
        onDestinationSelected:
            (value) => widget.navigationShell.goBranch(value),
        selectedIndex: widget.navigationShell.currentIndex,
      ),
    );
  }
}
