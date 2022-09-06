import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// {@template drawer}
/// A widget that displays the drawer for the app.
/// {@endtemplate}
class SharedDrawer extends Drawer {
  /// {@macro drawer}
  const SharedDrawer({
    super.key,
    required this.drawerItems,
  });

  /// The items displayed in the [Drawer] <RouteName, DisplayName>.
  final List<DrawerItem> drawerItems;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
        children: [
          const DrawerHeader(
            child: Center(child: Text('State comparison')),
          ),
          ...drawerItems.map(
            (entry) => ListTile(
              title: Text(entry.displayName),
              onTap: () => Navigator.pushNamed(
                context,
                entry.routeName,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// {@template drawer_item}
/// A model representing a drawer item.
/// {@endtemplate}
class DrawerItem {
  /// {@macro drawer_item}
  const DrawerItem({
    required this.routeName,
    required this.displayName,
  });

  /// The route name pushed when tapped on the drawer item.
  final String routeName;

  /// The display name of the drawer item.
  final String displayName;
}
