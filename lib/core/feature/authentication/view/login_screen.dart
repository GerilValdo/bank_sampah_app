// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:starting_slicing/app/constants/export.dart';
// import 'package:starting_slicing/app/widgets/default_button.dart';
// import 'package:starting_slicing/app/widgets/input_decoration.dart';

// @RoutePage()
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//   static const String id = '/login';

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Login',
//           style: AppTextStyle.bold(fontSize: AppFontSize.h4),
//         ),
//       ),
//       body: Padding(
//         padding: AppSpacing.p20,
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: customInputDecoration("Email"),
//               ),
//               AppSpacing.h16,
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: customInputDecoration("Password"),

//                 obscureText: true,
//               ),
//               AppSpacing.h24,
//               DefaultButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(
//                           'Login berhasil',
//                           style: AppTextStyle.regular(
//                             fontSize: AppFontSize.body,
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 text: 'Login',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
