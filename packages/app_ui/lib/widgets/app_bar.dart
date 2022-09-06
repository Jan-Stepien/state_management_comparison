import 'package:flutter/material.dart';

/// {@template shared_app_bar}
/// A [AppBar] that is used throughout the app.
/// {@endtemplate}
class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// {@macro shared_app_bar}
  const SharedAppBar({super.key, this.title, this.cartRedirect});

  /// The title of the [AppBar].
  final String? title;

  /// The callback to redirect to when the cart icon is tapped.
  final VoidCallback? cartRedirect;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      actions: cartRedirect != null
          ? [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: cartRedirect,
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
