import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:state_comparison/app/app.dart';
import 'package:state_comparison/state_managements/inherited_widget/view/view.dart';
import 'package:state_comparison/state_managements/riverpod/riverpod.dart';
import 'package:state_comparison/state_managements/set_state/view/view.dart';
import 'package:state_comparison/state_managements/state_managemenets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Pages.home.name,
      onGenerateRoute: (settings) {
        if (settings.name == Pages.provider.name) {
          return MaterialPageRoute(
            builder: (context) => const ProviderPage(),
            settings: settings,
          );
        } else if (settings.name == Pages.riverpod.name) {
          return MaterialPageRoute(
            builder: (context) => const RiverpodPage(),
            settings: settings,
          );
        } else if (settings.name == Pages.setState.name) {
          return MaterialPageRoute(
            builder: (context) => const SetStatePage(),
            settings: settings,
          );
        } else if (settings.name == Pages.inheritedWidget.name) {
          return MaterialPageRoute(
            builder: (context) => const InheritedWidgetPage(),
            settings: settings,
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => const AppHome(),
            settings: settings,
          );
        }
      },
    );
  }
}

enum Pages {
  home,
  provider,
  riverpod,
  setState,
  inheritedWidget,
}

final drawerItems = [
  DrawerItem(
    routeName: Pages.home.name,
    displayName: 'Home',
  ),
  DrawerItem(
    routeName: Pages.provider.name,
    displayName: 'Provider',
  ),
  DrawerItem(
    routeName: Pages.riverpod.name,
    displayName: 'Riverpod',
  ),
  DrawerItem(
    routeName: Pages.setState.name,
    displayName: 'SetState',
  ),
  DrawerItem(
    routeName: Pages.inheritedWidget.name,
    displayName: 'Inherited Widget',
  ),
];
