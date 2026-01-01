// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:ilmnur_app/features/chat/presentation/pages/chat_screen.dart'
    as _i1;
import 'package:ilmnur_app/features/course/presentation/pages/course_screen.dart'
    as _i2;
import 'package:ilmnur_app/features/course/presentation/pages/main_screen.dart'
    as _i7;
import 'package:ilmnur_app/features/home/presentation/pages/groups_screen.dart'
    as _i3;
import 'package:ilmnur_app/features/home/presentation/pages/home_screen.dart'
    as _i4;
import 'package:ilmnur_app/features/lesson/presentation/pages/lesson_screen.dart'
    as _i5;
import 'package:ilmnur_app/features/login/presentation/pages/login_screen.dart'
    as _i6;
import 'package:ilmnur_app/features/news/presentation/pages/news_screen.dart'
    as _i8;
import 'package:ilmnur_app/features/profile/presentation/pages/profile_screen.dart'
    as _i9;
import 'package:ilmnur_app/features/reyting/presentation/pages/reyting_screen.dart'
    as _i10;
import 'package:ilmnur_app/features/tests/presentation/pages/test_screen.dart'
    as _i11;

/// generated route for
/// [_i1.ChatScreen]
class ChatRoute extends _i12.PageRouteInfo<void> {
  const ChatRoute({List<_i12.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChatScreen();
    },
  );
}

/// generated route for
/// [_i2.CourseScreen]
class CourseRoute extends _i12.PageRouteInfo<CourseRouteArgs> {
  CourseRoute({
    _i13.Key? key,
    required int courseId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         CourseRoute.name,
         args: CourseRouteArgs(key: key, courseId: courseId),
         initialChildren: children,
       );

  static const String name = 'CourseRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CourseRouteArgs>();
      return _i2.CourseScreen(key: args.key, courseId: args.courseId);
    },
  );
}

class CourseRouteArgs {
  const CourseRouteArgs({this.key, required this.courseId});

  final _i13.Key? key;

  final int courseId;

  @override
  String toString() {
    return 'CourseRouteArgs{key: $key, courseId: $courseId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CourseRouteArgs) return false;
    return key == other.key && courseId == other.courseId;
  }

  @override
  int get hashCode => key.hashCode ^ courseId.hashCode;
}

/// generated route for
/// [_i3.GroupsScreen]
class GroupsRoute extends _i12.PageRouteInfo<void> {
  const GroupsRoute({List<_i12.PageRouteInfo>? children})
    : super(GroupsRoute.name, initialChildren: children);

  static const String name = 'GroupsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.GroupsScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.LessonScreen]
class LessonRoute extends _i12.PageRouteInfo<LessonRouteArgs> {
  LessonRoute({
    _i13.Key? key,
    required int lessonId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         LessonRoute.name,
         args: LessonRouteArgs(key: key, lessonId: lessonId),
         initialChildren: children,
       );

  static const String name = 'LessonRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonRouteArgs>();
      return _i5.LessonScreen(key: args.key, lessonId: args.lessonId);
    },
  );
}

class LessonRouteArgs {
  const LessonRouteArgs({this.key, required this.lessonId});

  final _i13.Key? key;

  final int lessonId;

  @override
  String toString() {
    return 'LessonRouteArgs{key: $key, lessonId: $lessonId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LessonRouteArgs) return false;
    return key == other.key && lessonId == other.lessonId;
  }

  @override
  int get hashCode => key.hashCode ^ lessonId.hashCode;
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i12.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i13.Key? key,
    required int id,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         MainRoute.name,
         args: MainRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'MainRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainRouteArgs>();
      return _i7.MainScreen(key: args.key, id: args.id);
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({this.key, required this.id});

  final _i13.Key? key;

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
/// [_i8.NewsScreen]
class NewsRoute extends _i12.PageRouteInfo<void> {
  const NewsRoute({List<_i12.PageRouteInfo>? children})
    : super(NewsRoute.name, initialChildren: children);

  static const String name = 'NewsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.NewsScreen();
    },
  );
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i10.ReytingScreen]
class ReytingRoute extends _i12.PageRouteInfo<ReytingRouteArgs> {
  ReytingRoute({_i13.Key? key, List<_i12.PageRouteInfo>? children})
    : super(
        ReytingRoute.name,
        args: ReytingRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ReytingRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReytingRouteArgs>(
        orElse: () => const ReytingRouteArgs(),
      );
      return _i10.ReytingScreen(key: args.key);
    },
  );
}

class ReytingRouteArgs {
  const ReytingRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ReytingRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ReytingRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i11.TestsScreen]
class TestsRoute extends _i12.PageRouteInfo<TestsRouteArgs> {
  TestsRoute({
    _i13.Key? key,
    required int testId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         TestsRoute.name,
         args: TestsRouteArgs(key: key, testId: testId),
         initialChildren: children,
       );

  static const String name = 'TestsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestsRouteArgs>();
      return _i11.TestsScreen(key: args.key, testId: args.testId);
    },
  );
}

class TestsRouteArgs {
  const TestsRouteArgs({this.key, required this.testId});

  final _i13.Key? key;

  final int testId;

  @override
  String toString() {
    return 'TestsRouteArgs{key: $key, testId: $testId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestsRouteArgs) return false;
    return key == other.key && testId == other.testId;
  }

  @override
  int get hashCode => key.hashCode ^ testId.hashCode;
}
