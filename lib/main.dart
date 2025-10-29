import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/core/router/app_router_observer.dart';
import 'package:bank_sampah_app/core/utils/theme_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, minTextAdapt: true, splitScreenMode: false);
    return MaterialApp.router(
      title: 'Sampahku',
      routerConfig: appRouter.config(
        navigatorObservers: () => [AppRouteObserver()],
      ),
      debugShowCheckedModeBanner: false,
      theme: themeDataDecoration(),
    );
  }
}
