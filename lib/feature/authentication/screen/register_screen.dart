import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/feature/authentication/bloc/auth_bloc.dart';
import 'package:bank_sampah_app/feature/authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const id = '/register';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final TextEditingController nameC = TextEditingController();
    final TextEditingController emailC = TextEditingController();
    final TextEditingController phoneNumberC = TextEditingController();
    final TextEditingController passwordC = TextEditingController();
    final TextEditingController confirmPasswordC = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    Future<void> _register() async {
      if (!_formKey.currentState!.validate()) return;
       context.read<AuthBloc>().add(
          AuthEvent.register(
            name: nameC.text,
            email: emailC.text.trim(),
            phoneNumber: phoneNumberC.text.trim(),
            password: passwordC.text.trim(),
          ),
        );
    }

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
      authenticated: (user) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created successfully 🎉')),
        );
        context.replaceRoute(MainRoute());
      },
      error: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
        );
      },
    );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.07,
              vertical: height * 0.08,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // === Logo ===
                Container(
                  height: height * 0.1,
                  width: height * 0.1,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.webp'),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),

                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF006045),
                  ),
                ),
                SizedBox(height: height * 0.008),
                Text(
                  'Join us in making a difference',
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: height * 0.025,
                        children: [
                          CustomTextFormField(
                            controller: nameC,
                            label: 'Full Name',
                            hintText: 'your name',
                            prefixIcon: Icons.person_outline_outlined,
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Name required' : null,
                          ),
                          CustomTextFormField(
                            controller: emailC,
                            label: 'Email',
                            hintText: 'your.email@example.com',
                            prefixIcon: Icons.mail_outline_rounded,
                            validator: (v) =>
                                v == null ||
                                    !v.contains('@') ||
                                    !v.contains('.')
                                ? 'Enter valid email'
                                : null,
                          ),
                          CustomTextFormField(
                            controller: phoneNumberC,
                            label: 'Phone Number',
                            hintText: 'Enter your phone number',
                            prefixIcon: Icons.phone_outlined,
                            validator: (v) => v == null || v.length < 10
                                ? 'Invalid phone'
                                : null,
                          ),
                          CustomTextFormField(
                            controller: passwordC,
                            label: 'Password',
                            hintText: '••••••••',
                            prefixIcon: Icons.lock_outline_rounded,
                            validator: (v) => v == null || v.length < 8
                                ? 'Min 8 characters'
                                : null,
                          ),
                          CustomTextFormField(
                            controller: confirmPasswordC,
                            label: 'Confirm Password',
                            hintText: '••••••••',
                            prefixIcon: Icons.lock_outline_rounded,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Confirm password required';
                              }
                              if (v != passwordC.text) {
                                return 'Password do not match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: height * 0.015),
                          // === Login Button ===
                          InkWell(
                            borderRadius: BorderRadius.circular(30),
                            onTap: () {
                              _register();
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
                                'Create Account',
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),

                // === Register ===
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.replaceRoute(LoginRoute());
                      },
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text(
                        'Login',
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
    );
  }
}
