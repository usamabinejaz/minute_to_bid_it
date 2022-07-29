import 'package:flutter/material.dart';

import '../util/core.dart';

// ignore_for_file: constant_identifier_names
enum RouteData {
  /// For routes for which we want to show unknown page that are not being parsed
  unknownRoute,

  ///Main Pages, First division of drawer
  my_all_projects,
  templates,
  media,
  profile,

  ///Second division of drawer
  plan_and_prices,
  stock_icons,

  /// For routes that are parsed but not data is found for them eg. /user/?userName=abc and abc doesn't exist
  notFound,
  login,
  home,
  more,
  settings
}

class RouteHandler {
  static final RouteHandler _instance = RouteHandler._();

  factory RouteHandler() => _instance;

  RouteHandler._();

  /// Returns [WidgetToRender, PathName]
  /// [WidgetToRender] - Renders specified widget
  /// [PathName] - Re-directs to [PathName] if invalid path is entered
  Widget getRouteWidget(String? routeName) {
    RouteData routeData;

    if (routeName != null) {
      final uri = Uri.parse(routeName);

      if (uri.pathSegments.isNotEmpty) {
        /// Getting first endpoint
        final pathName = uri.pathSegments.elementAt(0).toString();

        /// Getting route data for specified pathName
        routeData = RouteData.values.firstWhere(
            (element) => element.name == pathName,
            orElse: () => RouteData.notFound);

        if (routeData != RouteData.notFound) {
          switch (routeData) {
            case RouteData.home:
              return Home(
                routeName: routeName,
              );
            case RouteData.login:
              return const LoginScreen();
            //
            // case RouteData.settings:
            //   return Settings(
            //     routeName: routeName,
            //   );
            //
            // case RouteData.more:
            //   return More(
            //     routeName: routeName,
            //   );

            default:
              return Home(
                routeName: routeName,
              );
          }
        } else {
          return const UnknownRoute();
        }
      } else {
        return Home(
          routeName: routeName,
        );
      }
    } else {
      return const UnknownRoute();
    }
  }
}
