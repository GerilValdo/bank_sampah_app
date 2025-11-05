import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/constants/export.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String id = '/splash';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.router.replaceAll([LoginRoute()]);
      // Navigate to next screen here, e.g.:
      // Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF34D399), // emerald-400
              Color(0xFF14B8A6), // teal-500
              Color(0xFF16A34A), // green-600
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔄 Animasi ikonik recycle berputar & melompat
            ElasticIn(
              duration: const Duration(milliseconds: 800),
              child: SpinPerfect(
                duration: const Duration(milliseconds: 1200),
                infinite: false,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Latar belakang bundar blur
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 20,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(AppImage.kLogoPNG),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            // 🌿 Fade-in Text
            FadeInUp(
              delay: const Duration(milliseconds: 1000),
              duration: const Duration(milliseconds: 600),
              child: const Text(
                "Bank Sampah",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            FadeInUp(
              delay: const Duration(milliseconds: 1200),
              duration: const Duration(milliseconds: 600),
              child: const Text(
                "Recycling for a Better Future",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 0.3,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // 🔘 Animated loading dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pulse(
                  delay: Duration(milliseconds: 1300),
                  duration: Duration(milliseconds: 800),
                  infinite: true,
                  child: _Dot(),
                ),
                SizedBox(width: 8),
                Pulse(
                  delay: Duration(milliseconds: 1450),
                  duration: Duration(milliseconds: 800),
                  infinite: true,
                  child: _Dot(),
                ),
                SizedBox(width: 8),
                Pulse(
                  delay: Duration(milliseconds: 1600),
                  duration: Duration(milliseconds: 800),
                  infinite: true,
                  child: _Dot(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
