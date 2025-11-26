import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FirebaseLoginScreen extends StatefulWidget {
  const FirebaseLoginScreen({super.key});
  static const String id = '/firebase-login';

  @override
  State<FirebaseLoginScreen> createState() => _FirebaseLoginScreenState();
}

class _FirebaseLoginScreenState extends State<FirebaseLoginScreen> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    context.read<FirebaseAuthBloc>().add(
      FirebaseAuthEvent.login(
        email: emailC.text.trim(),
        password: passwordC.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return BlocListener<FirebaseAuthBloc, FirebaseAuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            
          },
          authenticated: (user) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Successful 🎉')),
            );

            // Navigation based on role
            if (user.role == "admin") {
              context.router.replaceAll([const AdminDashboardRoute()]);
            } else {
              context.router.replaceAll([FirebaseMainRoute()]);
            }
          },
          error: (message) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.redAccent,
              ),
            );
          },
        );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.07,
              vertical: height * 0.05,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: height * 0.07),

                  // Logo
                  Container(
                    height: height * 0.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.webp'),
                      ),
                    ),
                  ),

                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF006045),
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  // Card Form
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.07),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            label: "Email",
                            controller: emailC,
                            hintText: "your@email.com",
                            prefixIcon: Icons.email_outlined,
                            validator: (v) => v != null && v.contains("@")
                                ? null
                                : "Invalid email",
                          ),
                          SizedBox(height: height * 0.02),

                          CustomTextFormField(
                            label: "Password",
                            controller: passwordC,
                            hintText: "********",
                            obscureText: true,
                            prefixIcon: Icons.lock_outline,
                            validator: (v) => v != null && v.length >= 8
                                ? null
                                : "Min 8 characters",
                          ),

                          SizedBox(height: height * 0.02),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(color: Color(0xFF009966)),
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.03),

                          InkWell(
                            onTap: _login,
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.018,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF00BC7D),
                                    Color(0xFF00BBA7),
                                  ],
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          context.replaceRoute(const FirebaseRegisterRoute());
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Color(0xFF009966)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
