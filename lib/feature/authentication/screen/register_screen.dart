import 'package:bank_sampah_app/feature/authentication/screen/login_screen.dart';
import 'package:bank_sampah_app/feature/authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
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
                  child: Column(
                    spacing: height * 0.025,
                    children: [
                      CustomTextFormField(
                        label: 'Full Name',
                        hintText: 'your name',
                        prefixIcon: Icons.person_outline_outlined,
                      ),
                      CustomTextFormField(
                        label: 'Email',
                        hintText: 'your.email@example.com',
                        prefixIcon: Icons.mail_outline_rounded,
                      ),
                      CustomTextFormField(
                        label: 'Phone Number',
                        hintText: '+62 812 3456 7890',
                        prefixIcon: Icons.phone_outlined,
                      ),
                      CustomTextFormField(
                        label: 'Password',
                        hintText: '••••••••',
                        prefixIcon: Icons.lock_outline_rounded,
                      ),
                      CustomTextFormField(
                        label: 'Confirm Password',
                        hintText: '••••••••',
                        prefixIcon: Icons.lock_outline_rounded,
                      ),
                      SizedBox(height: height * 0.015),
                      // === Login Button ===
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: height * 0.018),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFF00BC7D), Color(0xFF00BBA7)],
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
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
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
    );
  }
}
