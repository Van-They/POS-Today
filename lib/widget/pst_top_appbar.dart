import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PstTopAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  const PstTopAppbar({
    this.title = "",
    this.automaticallyImplyLeading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouter.of(context).routeInformationProvider.value.uri.toString();
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: IconButton(onPressed: () {
       //todo finish current activity
       context.pop(currentRoute);
      }, icon: Icon(Icons.arrow_back_rounded)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
