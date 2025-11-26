// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AdminDashboardScreen]
class AdminDashboardRoute extends PageRouteInfo<void> {
  const AdminDashboardRoute({List<PageRouteInfo>? children})
    : super(AdminDashboardRoute.name, initialChildren: children);

  static const String name = 'AdminDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminDashboardScreen();
    },
  );
}

/// generated route for
/// [AdminTransactionScreen]
class AdminTransactionRoute extends PageRouteInfo<void> {
  const AdminTransactionRoute({List<PageRouteInfo>? children})
    : super(AdminTransactionRoute.name, initialChildren: children);

  static const String name = 'AdminTransactionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminTransactionScreen();
    },
  );
}

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
/// [FirebaseDashboardScreen]
class FirebaseDashboardRoute extends PageRouteInfo<void> {
  const FirebaseDashboardRoute({List<PageRouteInfo>? children})
    : super(FirebaseDashboardRoute.name, initialChildren: children);

  static const String name = 'FirebaseDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FirebaseDashboardScreen();
    },
  );
}

/// generated route for
/// [FirebaseLoginScreen]
class FirebaseLoginRoute extends PageRouteInfo<void> {
  const FirebaseLoginRoute({List<PageRouteInfo>? children})
    : super(FirebaseLoginRoute.name, initialChildren: children);

  static const String name = 'FirebaseLoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FirebaseLoginScreen();
    },
  );
}

/// generated route for
/// [FirebaseMainScreen]
class FirebaseMainRoute extends PageRouteInfo<FirebaseMainRouteArgs> {
  FirebaseMainRoute({
    Key? key,
    int initialIndex = 0,
    List<PageRouteInfo>? children,
  }) : super(
         FirebaseMainRoute.name,
         args: FirebaseMainRouteArgs(key: key, initialIndex: initialIndex),
         rawPathParams: {'initialIndex': initialIndex},
         initialChildren: children,
       );

  static const String name = 'FirebaseMainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<FirebaseMainRouteArgs>(
        orElse: () => FirebaseMainRouteArgs(
          initialIndex: pathParams.getInt('initialIndex', 0),
        ),
      );
      return FirebaseMainScreen(key: args.key, initialIndex: args.initialIndex);
    },
  );
}

class FirebaseMainRouteArgs {
  const FirebaseMainRouteArgs({this.key, this.initialIndex = 0});

  final Key? key;

  final int initialIndex;

  @override
  String toString() {
    return 'FirebaseMainRouteArgs{key: $key, initialIndex: $initialIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FirebaseMainRouteArgs) return false;
    return key == other.key && initialIndex == other.initialIndex;
  }

  @override
  int get hashCode => key.hashCode ^ initialIndex.hashCode;
}

/// generated route for
/// [FirebaseRegisterScreen]
class FirebaseRegisterRoute extends PageRouteInfo<void> {
  const FirebaseRegisterRoute({List<PageRouteInfo>? children})
    : super(FirebaseRegisterRoute.name, initialChildren: children);

  static const String name = 'FirebaseRegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FirebaseRegisterScreen();
    },
  );
}

/// generated route for
/// [HistoryFirebaseScreen]
class HistoryFirebaseRoute extends PageRouteInfo<void> {
  const HistoryFirebaseRoute({List<PageRouteInfo>? children})
    : super(HistoryFirebaseRoute.name, initialChildren: children);

  static const String name = 'HistoryFirebaseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HistoryFirebaseScreen();
    },
  );
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
/// [ProfileFirebaseScreen]
class ProfileFirebaseRoute extends PageRouteInfo<void> {
  const ProfileFirebaseRoute({List<PageRouteInfo>? children})
    : super(ProfileFirebaseRoute.name, initialChildren: children);

  static const String name = 'ProfileFirebaseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileFirebaseScreen();
    },
  );
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

/// generated route for
/// [WithdrawFirebaseScreen]
class WithdrawFirebaseRoute extends PageRouteInfo<void> {
  const WithdrawFirebaseRoute({List<PageRouteInfo>? children})
    : super(WithdrawFirebaseRoute.name, initialChildren: children);

  static const String name = 'WithdrawFirebaseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WithdrawFirebaseScreen();
    },
  );
}

/// generated route for
/// [WithdrawScreen]
class WithdrawRoute extends PageRouteInfo<void> {
  const WithdrawRoute({List<PageRouteInfo>? children})
    : super(WithdrawRoute.name, initialChildren: children);

  static const String name = 'WithdrawRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WithdrawScreen();
    },
  );
}
