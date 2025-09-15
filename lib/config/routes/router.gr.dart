// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:ilmnur_app/features/course/presentation/pages/main_screen.dart'
    as _i3;
import 'package:ilmnur_app/features/home/presentation/pages/groups_screen.dart'
    as _i1;
import 'package:ilmnur_app/features/home/presentation/pages/home_screen.dart'
    as _i2;

/// generated route for
/// [_i1.GroupsScreen]
class GroupsRoute extends _i4.PageRouteInfo<void> {
  const GroupsRoute({List<_i4.PageRouteInfo>? children})
    : super(GroupsRoute.name, initialChildren: children);

  static const String name = 'GroupsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.GroupsScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i4.PageRouteInfo<MainRouteArgs> {
  MainRoute({required int id, List<_i4.PageRouteInfo>? children})
    : super(
        MainRoute.name,
        args: MainRouteArgs(id: id),
        initialChildren: children,
      );

  static const String name = 'MainRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainRouteArgs>();
      return _i3.MainScreen(id: args.id);
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({required this.id});

  final int id;

  @override
  String toString() {
    return 'MainRouteArgs{id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MainRouteArgs) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
