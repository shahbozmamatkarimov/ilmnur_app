// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:ilmnur_app/features/chat/presentation/pages/chat_screen.dart'
    as _i1;
import 'package:ilmnur_app/features/course/presentation/pages/main_screen.dart'
    as _i5;
import 'package:ilmnur_app/features/home/presentation/pages/groups_screen.dart'
    as _i2;
import 'package:ilmnur_app/features/home/presentation/pages/home_screen.dart'
    as _i3;
import 'package:ilmnur_app/features/lesson/presentation/pages/lesson_screen.dart'
    as _i4;
import 'package:ilmnur_app/features/news/presentation/pages/news_screen.dart'
    as _i6;
import 'package:ilmnur_app/features/reyting/presentation/pages/reyting_screen.dart'
    as _i7;
import 'package:ilmnur_app/features/tests/presentation/pages/test_screen.dart'
    as _i8;

/// generated route for
/// [_i1.ChatScreen]
class ChatRoute extends _i9.PageRouteInfo<void> {
  const ChatRoute({List<_i9.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChatScreen();
    },
  );
}

/// generated route for
/// [_i2.GroupsScreen]
class GroupsRoute extends _i9.PageRouteInfo<void> {
  const GroupsRoute({List<_i9.PageRouteInfo>? children})
    : super(GroupsRoute.name, initialChildren: children);

  static const String name = 'GroupsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.GroupsScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.LessonScreen]
class LessonRoute extends _i9.PageRouteInfo<LessonRouteArgs> {
  LessonRoute({required int lessonId, List<_i9.PageRouteInfo>? children})
    : super(
        LessonRoute.name,
        args: LessonRouteArgs(lessonId: lessonId),
        initialChildren: children,
      );

  static const String name = 'LessonRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonRouteArgs>();
      return _i4.LessonScreen(lessonId: args.lessonId);
    },
  );
}

class LessonRouteArgs {
  const LessonRouteArgs({required this.lessonId});

  final int lessonId;

  @override
  String toString() {
    return 'LessonRouteArgs{lessonId: $lessonId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LessonRouteArgs) return false;
    return lessonId == other.lessonId;
  }

  @override
  int get hashCode => lessonId.hashCode;
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i9.PageRouteInfo<MainRouteArgs> {
  MainRoute({_i10.Key? key, required int id, List<_i9.PageRouteInfo>? children})
    : super(
        MainRoute.name,
        args: MainRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'MainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainRouteArgs>();
      return _i5.MainScreen(key: args.key, id: args.id);
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({this.key, required this.id});

  final _i10.Key? key;

  final int id;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MainRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i6.NewsScreen]
class NewsRoute extends _i9.PageRouteInfo<void> {
  const NewsRoute({List<_i9.PageRouteInfo>? children})
    : super(NewsRoute.name, initialChildren: children);

  static const String name = 'NewsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i6.NewsScreen();
    },
  );
}

/// generated route for
/// [_i7.ReytingScreen]
class ReytingRoute extends _i9.PageRouteInfo<void> {
  const ReytingRoute({List<_i9.PageRouteInfo>? children})
    : super(ReytingRoute.name, initialChildren: children);

  static const String name = 'ReytingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i7.ReytingScreen();
    },
  );
}

/// generated route for
/// [_i8.TestsScreen]
class TestsRoute extends _i9.PageRouteInfo<TestsRouteArgs> {
  TestsRoute({required int testId, List<_i9.PageRouteInfo>? children})
    : super(
        TestsRoute.name,
        args: TestsRouteArgs(testId: testId),
        initialChildren: children,
      );

  static const String name = 'TestsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestsRouteArgs>();
      return _i8.TestsScreen(testId: args.testId);
    },
  );
}

class TestsRouteArgs {
  const TestsRouteArgs({required this.testId});

  final int testId;

  @override
  String toString() {
    return 'TestsRouteArgs{testId: $testId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestsRouteArgs) return false;
    return testId == other.testId;
  }

  @override
  int get hashCode => testId.hashCode;
}
