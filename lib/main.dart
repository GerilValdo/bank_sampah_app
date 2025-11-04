import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/core/router/app_router_observer.dart';
import 'package:bank_sampah_app/core/utils/theme_decoration.dart';
import 'package:bank_sampah_app/feature/deposit/bloc/category_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/bloc/deposit_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/database/category_local_data_source.dart';
import 'package:bank_sampah_app/feature/deposit/database/deposit_local_data_source.dart';
import 'package:bank_sampah_app/feature/history/bloc/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(CategoryLocalDataSource()),
        ),
        BlocProvider(
          create: (context) => DepositBloc(DepositLocalDataSource()),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(DepositLocalDataSource()),
        ),

      ],
      child: MaterialApp.router(
        title: 'Sampahku',
        routerConfig: appRouter.config(
          navigatorObservers: () => [AppRouteObserver()],
        ),
        debugShowCheckedModeBanner: false,
        theme: themeDataDecoration(),
      ),
    );
  }
}
