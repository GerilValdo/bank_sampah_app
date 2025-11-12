import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/constants/export.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/core/services/auth_prefs_service.dart';
import 'package:bank_sampah_app/feature/authentication/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();

    // Jalankan pengecekan login setelah animasi selesai
    Future.delayed(const Duration(seconds: 3), () {
      context.read<AuthBloc>().add(AuthEvent.loadUser());
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          await Future.delayed(const Duration(milliseconds: 1000));
          state.maybeWhen(
            authenticated: (user) async {
              final role = await AuthPrefsService.getRole();
              if (role == 'admin') {
                context.replaceRoute(AdminDashboardRoute());
              } else {
                context.replaceRoute(MainRoute());
              }
            },
            unauthenticated: () => context.replaceRoute(LoginRoute()),
            orElse: () {},
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 🌈 Gradient background
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF34D399),
                    Color(0xFF10B981),
                    Color(0xFF059669),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            // 🌟 Animated content
            FadeTransition(
              opacity: _fadeController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🔹 Logo animation
                  ZoomIn(
                    duration: const Duration(milliseconds: 1000),
                    child: Hero(
                      tag: 'appLogo',
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        // height: MediaQuery.of(context).size.height ,
                        // decoration: BoxDecoration(
                        //   color: Colors.white.withOpacity(0.2),
                        //   shape: BoxShape.circle,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.15),
                        //     blurRadius: 20,
                        //   ),
                        // ],
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AppImage.kLogoPNG,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // const SizedBox(height: 30),

                  // 🔹 App name with fade + slide
                  // FadeInUp(
                  //   delay: const Duration(milliseconds: 800),
                  //   duration: const Duration(milliseconds: 900),
                  //   from: 15,
                  //   child: const Text(
                  //     "Sampahku",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 30,
                  //       fontWeight: FontWeight.bold,
                  //       letterSpacing: 1.5,
                  //     ),
                  //   ),
                  // ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1200),
                    duration: const Duration(milliseconds: 900),
                    from: 15,
                    child: const Text(
                      "Recycling for a Better Future",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 🔹 Animated Dots (loading indicator)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      _AnimatedDot(delay: 0),
                      SizedBox(width: 8),
                      _AnimatedDot(delay: 200),
                      SizedBox(width: 8),
                      _AnimatedDot(delay: 400),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedDot extends StatelessWidget {
  final int delay;
  const _AnimatedDot({required this.delay});

  @override
  Widget build(BuildContext context) {
    return Pulse(
      delay: Duration(milliseconds: 1200 + delay),
      duration: const Duration(milliseconds: 900),
      infinite: true,
      child: Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
