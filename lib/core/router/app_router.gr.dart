// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [DepositWasteScreen]
class DepositWasteRoute extends PageRouteInfo<DepositWasteRouteArgs> {
  DepositWasteRoute({
    Key? key,
    DepositModel? deposit,
    List<PageRouteInfo>? children,
  }) : super(
         DepositWasteRoute.name,
         args: DepositWasteRouteArgs(key: key, deposit: deposit),
         initialChildren: children,
       );

  static const String name = 'DepositWasteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DepositWasteRouteArgs>(
        orElse: () => const DepositWasteRouteArgs(),
      );
      return DepositWasteScreen(key: args.key, deposit: args.deposit);
    },
  );
}

class DepositWasteRouteArgs {
  const DepositWasteRouteArgs({this.key, this.deposit});

  final Key? key;

  final DepositModel? deposit;

  @override
  String toString() {
    return 'DepositWasteRouteArgs{key: $key, deposit: $deposit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DepositWasteRouteArgs) return false;
    return key == other.key && deposit == other.deposit;
  }

  @override
  int get hashCode => key.hashCode ^ deposit.hashCode;
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
    : super(HistoryRoute.name, initialChildren: children);

  static const String name = 'HistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HistoryScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({Key? key, int initialIndex = 0, List<PageRouteInfo>? children})
    : super(
        MainRoute.name,
        args: MainRouteArgs(key: key, initialIndex: initialIndex),
        rawPathParams: {'initialIndex': initialIndex},
        initialChildren: children,
      );

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<MainRouteArgs>(
        orElse: () =>
            MainRouteArgs(initialIndex: pathParams.getInt('initialIndex', 0)),
      );
      return MainScreen(key: args.key, initialIndex: args.initialIndex);
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({this.key, this.initialIndex = 0});

  final Key? key;

  final int initialIndex;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, initialIndex: $initialIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MainRouteArgs) return false;
    return key == other.key && initialIndex == other.initialIndex;
  }

  @override
  int get hashCode => key.hashCode ^ initialIndex.hashCode;
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [RewardsScreen]
class RewardsRoute extends PageRouteInfo<void> {
  const RewardsRoute({List<PageRouteInfo>? children})
    : super(RewardsRoute.name, initialChildren: children);

  static const String name = 'RewardsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RewardsScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
