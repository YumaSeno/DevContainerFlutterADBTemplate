// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [ListScreen]
class ListRoute extends PageRouteInfo<void> {
  const ListRoute({List<PageRouteInfo>? children})
    : super(ListRoute.name, initialChildren: children);

  static const String name = 'ListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListScreen();
    },
  );
}

/// generated route for
/// [OverlayShell]
class OverlayRoute extends PageRouteInfo<void> {
  const OverlayRoute({List<PageRouteInfo>? children})
    : super(OverlayRoute.name, initialChildren: children);

  static const String name = 'OverlayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OverlayShell();
    },
  );
}
