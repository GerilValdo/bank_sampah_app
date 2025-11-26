import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/feature/admin/dashboard/admin_dashboard_screen.dart';
import 'package:bank_sampah_app/feature/admin/transactions/screen/admin_transaction_screen.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/screen/firebase_login_screen.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/screen/firebase_register_screen.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/screen/login_screen.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/screen/register_screen.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/screen/splash_screen.dart';
import 'package:bank_sampah_app/feature/dashboard/screen/dashboard_screen.dart';
import 'package:bank_sampah_app/feature/dashboard/screen/firebase_dashboard_screen.dart';
import 'package:bank_sampah_app/feature/deposit/models/deposit_model.dart';
import 'package:bank_sampah_app/feature/deposit/presentation/screen/deposit_waste_screen.dart';
import 'package:bank_sampah_app/feature/history/presentation/screen/history_firebase_screen.dart';
import 'package:bank_sampah_app/feature/history/presentation/screen/history_screen.dart';
import 'package:bank_sampah_app/feature/main/screen/firebase_main_screen.dart';
import 'package:bank_sampah_app/feature/main/screen/main_screen.dart';
import 'package:bank_sampah_app/feature/profile/screen/profile_firebase_screen.dart';
import 'package:bank_sampah_app/feature/profile/screen/profile_screen.dart';
import 'package:bank_sampah_app/feature/withdraw/screen/withdraw_firebase_screen.dart';
import 'package:bank_sampah_app/feature/withdraw/screen/withdraw_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: SplashScreen.id, initial: true),
    AutoRoute(page: LoginRoute.page, path: LoginScreen.id),
    AutoRoute(page: FirebaseLoginRoute.page, path: FirebaseLoginScreen.id),
    AutoRoute(
      page: FirebaseRegisterRoute.page,
      path: FirebaseRegisterScreen.id,
    ),
    AutoRoute(page: RegisterRoute.page, path: RegisterScreen.id),
    AutoRoute(page: DashboardRoute.page, path: DashboardScreen.id),
    AutoRoute(
      page: FirebaseDashboardRoute.page,
      path: FirebaseDashboardScreen.id,
    ),
    AutoRoute(page: HistoryRoute.page, path: HistoryScreen.id),
    AutoRoute(page: HistoryFirebaseRoute.page, path: HistoryFirebaseScreen.id),
    AutoRoute(page: ProfileRoute.page, path: ProfileScreen.id),
    AutoRoute(page: ProfileFirebaseRoute.page, path: ProfileFirebaseScreen.id),
    AutoRoute(page: MainRoute.page, path: MainScreen.id),
    AutoRoute(page: FirebaseMainRoute.page, path: FirebaseMainScreen.id),
    AutoRoute(page: WithdrawRoute.page, path: WithdrawScreen.id),
    AutoRoute(
      page: WithdrawFirebaseRoute.page,
      path: WithdrawFirebaseScreen.id,
    ),
    AutoRoute(page: DepositWasteRoute.page, path: DepositWasteScreen.id),
    AutoRoute(page: AdminDashboardRoute.page, path: AdminDashboardScreen.id),
    AutoRoute(
      page: AdminTransactionRoute.page,
      path: AdminTransactionScreen.id,
    ),
  ];
}
