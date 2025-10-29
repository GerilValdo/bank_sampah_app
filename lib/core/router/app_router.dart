import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/feature/authentication/screen/login_screen.dart';
import 'package:bank_sampah_app/feature/authentication/splash_screen.dart';
import 'package:bank_sampah_app/feature/dashboard/screen/dashboard_screen.dart';
import 'package:bank_sampah_app/feature/history/screen/history_screen.dart';

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
    AutoRoute(page: DashboardRoute.page, path: DashboardScreen.id),
    AutoRoute(page: HistoryRoute.page, path: HistoryScreen.id),
  ];
}
