import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/feature/authentication/screen/login_screen.dart';
import 'package:bank_sampah_app/feature/authentication/screen/register_screen.dart';
import 'package:bank_sampah_app/feature/authentication/screen/splash_screen.dart';
import 'package:bank_sampah_app/feature/dashboard/screen/dashboard_screen.dart';
import 'package:bank_sampah_app/feature/deposit/models/deposit_model.dart';
import 'package:bank_sampah_app/feature/deposit/view/screen/deposit_waste_screen.dart';
import 'package:bank_sampah_app/feature/history/view/screen/history_screen.dart';
import 'package:bank_sampah_app/feature/main/screen/main_screen.dart';
import 'package:bank_sampah_app/feature/profile/screen/profile_screen.dart';
import 'package:bank_sampah_app/feature/rewards/screen/rewards_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true, path: SplashScreen.id),
    AutoRoute(page: LoginRoute.page, path: LoginScreen.id),
    AutoRoute(page: RegisterRoute.page, path: RegisterScreen.id),
    AutoRoute(page: DashboardRoute.page, path: DashboardScreen.id),
    AutoRoute(page: HistoryRoute.page, path: HistoryScreen.id),
    AutoRoute(page: ProfileRoute.page, path: ProfileScreen.id),
    AutoRoute(page: MainRoute.page, path: MainScreen.id),
    AutoRoute(page: RewardsRoute.page, path: RewardsScreen.id),
    AutoRoute(page: DepositWasteRoute.page, path: DepositWasteScreen.id),
  ];
}
