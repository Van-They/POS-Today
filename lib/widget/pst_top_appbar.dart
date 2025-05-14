import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_today/extension/pst_extension.dart';
import 'package:pos_today/widget/pst_text.dart';

class PstTopAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading,centerTitle;
  const PstTopAppbar({
    this.title = "",
    this.centerTitle = false,
    this.automaticallyImplyLeading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentRoute =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    return AppBar(
      centerTitle: centerTitle,
      title: PstText(
        text: title,
        color: context.color.onSurface,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: context.color.onPrimary,
      leading:
          automaticallyImplyLeading
              ? IconButton(
                onPressed: () {
                  //todo finish current activity
                  context.pop(currentRoute);
                },
                icon: Icon(Icons.arrow_back_rounded),
              )
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
