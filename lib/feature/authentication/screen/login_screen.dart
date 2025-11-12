import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/core/services/auth_prefs_service.dart';
import 'package:bank_sampah_app/feature/authentication/bloc/auth_bloc.dart';
import 'package:bank_sampah_app/feature/authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    // Hanya kirim event login, tanpa navigasi langsung
    context.read<AuthBloc>().add(
      AuthEvent.login(email: emailC.text, password: passwordC.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        // 🔹 Hanya trigger kalau state-nya benar-benar berubah
        final isNowAuthenticated = current.maybeWhen(
          authenticated: (_) => true,
          orElse: () => false,
        );
        final isNowError = current.maybeWhen(
          error: (_) => true,
          orElse: () => false,
        );
        final wasAuthenticated = previous.maybeWhen(
          authenticated: (_) => true,
          orElse: () => false,
        );
        final wasError = previous.maybeWhen(
          error: (_) => true,
          orElse: () => false,
        );

        // ✅ hanya trigger jika baru saja berpindah ke state ini
        return (!wasAuthenticated && isNowAuthenticated) ||
            (!wasError && isNowError);
      },
      listener: (context, state) {
        state.whenOrNull(
          authenticated: (user) async {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful 🎉')),
            );
            final role = await AuthPrefsService.getRole();

            if (role == 'admin') {
              context.router.replaceAll([const AdminDashboardRoute()]);
            } else {
              context.router.replaceAll([MainRoute()]);
            }
          },
          error: (message) {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // === Logo ===
                  Container(
                    height: height * 0.2,
                    // width: height * 0.1,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.webp'),
                      ),
                    ),
                  ),
                  // SizedBox(height: height * 0.02),

                  // === Welcome Text ===
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: width * 0.06, // responsive font
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF006045),
                    ),
                  ),
                  SizedBox(height: height * 0.008),
                  Text(
                    'Login to continue recycling',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: height * 0.04),

                  // === Card Form ===
                  Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.07),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            label: 'Email',
                            controller: emailC,
                            hintText: 'youremail@example.com',

                            prefixIcon: Icons.mail_outline,
                            validator: (v) =>
                                v == null ||
                                    !v.contains('@') ||
                                    !v.contains('.')
                                ? 'Enter valid email'
                                : null,
                          ),

                          SizedBox(height: height * 0.025),

                          CustomTextFormField(
                            label: 'Password',
                            controller: passwordC,
                            hintText: '••••••••',
                            obscureText: true,
                            prefixIcon: Icons.lock_outline,
                            validator: (v) => v == null || v.length < 8
                                ? 'Min 8 characters'
                                : null,
                          ),

                          SizedBox(height: height * 0.02),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: width * 0.033,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF009966),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.015),

                          // === Login Button ===
                          InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              _login();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.018,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFF00BC7D),
                                    Color(0xFF00BBA7),
                                  ],
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.03),

                          // === Divider ===
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(color: Color(0xFF009966)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                ),
                                child: Text(
                                  'Or continue with',
                                  style: TextStyle(
                                    color: const Color(0xFF009966),
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(color: Color(0xFF009966)),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.02),

                          // === Social Buttons ===
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _socialButton(
                                width,
                                Icons.g_mobiledata_rounded,
                                'Google',
                              ),
                              _socialButton(
                                width,
                                Icons.facebook_rounded,
                                'Facebook',
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),

                  // === Register ===
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.replaceRoute(RegisterRoute());
                        },
                        style: TextButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF009966),
                          ),
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

  // Helper Widget Social Button
  Widget _socialButton(
    double width,
    IconData icon,
    String text, {
    Color? color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: width * 0.025,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF009966)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: color ?? Colors.red),
          SizedBox(width: width * 0.02),
          Text(
            text,
            style: TextStyle(
              fontSize: width * 0.033,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
