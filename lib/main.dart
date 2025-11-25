import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/core/router/app_router_observer.dart';
import 'package:bank_sampah_app/core/utils/theme_decoration.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/auth_bloc.dart';
import 'package:bank_sampah_app/feature/authentication/data/datasource/user_local_datasource.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/view/bloc/category_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/view/bloc/deposit_bloc.dart';
import 'package:bank_sampah_app/feature/deposit/database/category_local_data_source.dart';
import 'package:bank_sampah_app/feature/deposit/database/deposit_local_data_source.dart';
import 'package:bank_sampah_app/feature/history/view/bloc/history_bloc.dart';
import 'package:bank_sampah_app/feature/rewards/bloc/withdraw_bloc.dart';
import 'package:bank_sampah_app/feature/rewards/database/withdraw_local_datasource.dart';
import 'package:bank_sampah_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        BlocProvider(create: (context) => AuthBloc(UserLocalDatasource())),
        BlocProvider(create: (context) => FirebaseAuthBloc()),
        BlocProvider(
          create: (context) => WithdrawBloc(WithdrawLocalDataSource()),
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
