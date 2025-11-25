import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FirebaseRegisterScreen extends StatefulWidget {
  const FirebaseRegisterScreen({super.key});
  static const String id = '/firebase-register';

  @override
  State<FirebaseRegisterScreen> createState() => _FirebaseRegisterScreenState();
}

class _FirebaseRegisterScreenState extends State<FirebaseRegisterScreen> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final phoneNumberC = TextEditingController();
  final passwordC = TextEditingController();
  final confirmPasswordC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameC.dispose();
    emailC.dispose();
    phoneNumberC.dispose();
    passwordC.dispose();
    confirmPasswordC.dispose();
    super.dispose();
  }

  void _register() {
    if (!formKey.currentState!.validate()) return;

    context.read<FirebaseAuthBloc>().add(
          FirebaseAuthEvent.register(
            username: nameC.text.trim(),
            email: emailC.text.trim(),
            password: passwordC.text.trim(),
            phoneNumber: phoneNumberC.text.trim(),
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
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Processing registration..."),
                duration: Duration(milliseconds: 1200),
              ),
            );
          },

          success: (message) async {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );

            await Future.delayed(const Duration(milliseconds: 800));

            if (!context.mounted) return;
            context.replaceRoute(const FirebaseLoginRoute());
          },

          error: (msg) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(msg),
                backgroundColor: Colors.redAccent,
              ),
            );
          },
        );
      },

      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.07,
            vertical: height * 0.08,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                /// LOGO
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

                /// TITLE
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
                  ),
                ),
                SizedBox(height: height * 0.04),

                /// CARD FORM
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
                          controller: nameC,
                          label: 'Full Name',
                          hintText: 'Your name',
                          prefixIcon: Icons.person_outline_outlined,
                          validator: (v) => v!.isEmpty ? 'Name required' : null,
                        ),
                        CustomTextFormField(
                          controller: emailC,
                          label: 'Email',
                          hintText: 'your.email@example.com',
                          prefixIcon: Icons.mail_outline_rounded,
                          validator: (v) => v!.contains('@') && v.contains('.')
                              ? null
                              : 'Enter valid email',
                        ),
                        CustomTextFormField(
                          controller: phoneNumberC,
                          label: 'Phone Number',
                          hintText: 'Enter your phone number',
                          prefixIcon: Icons.phone_outlined,
                          validator: (v) => v != null && v.length >= 10
                              ? null
                              : 'Invalid phone number',
                        ),
                        CustomTextFormField(
                          controller: passwordC,
                          label: 'Password',
                          hintText: '••••••••',
                          prefixIcon: Icons.lock_outline_rounded,
                          obscureText: true,
                          validator: (v) => v != null && v.length >= 8
                              ? null
                              : 'Min 8 characters',
                        ),
                        CustomTextFormField(
                          controller: confirmPasswordC,
                          label: 'Confirm Password',
                          hintText: '••••••••',
                          prefixIcon: Icons.lock_outline_rounded,
                          obscureText: true,
                          validator: (v) => (v == passwordC.text)
                              ? null
                              : 'Passwords do not match',
                        ),

                        SizedBox(height: height * 0.02),

                        /// REGISTER BUTTON
                        BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );

                            return InkWell(
                              onTap: isLoading ? null : _register,
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
                                child: isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'Create Account',
                                        style: TextStyle(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                /// LOGIN LINK
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: width * 0.035),
                    ),
                    TextButton(
                      onPressed: () {
                        context.replaceRoute(const FirebaseLoginRoute());
                      },
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
