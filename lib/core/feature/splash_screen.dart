// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:starting_slicing/app/constants/export.dart';
// import 'package:starting_slicing/app/router/app_router.dart';

// @RoutePage()
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//   static const String id = '/splash';
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 2), () {
//       context.router.replaceAll([LoginRoute()]);
//       // Navigate to next screen here, e.g.:
//       // Navigator.pushReplacementNamed(context, '/home');
//     });

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(AppImage.kLogoPNG, width: 100, height: 100),
//             const SizedBox(height: 20),

//             CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//               strokeWidth: 2.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
