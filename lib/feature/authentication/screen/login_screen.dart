import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/feature/authentication/screen/register_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String id = '/login';

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
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'your.email@example.com',
                          hintStyle: TextStyle(fontSize: width * 0.035),
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            color: Color(0xFF00BC7D),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xFFA4F4CF),
                              width: 1.5,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xFFA4F4CF),
                              width: 1.5,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF9F9F9),
                        ),
                      ),
                      SizedBox(height: height * 0.025),

                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF00BC7D),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xFFA4F4CF),
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xFFA4F4CF),
                              width: 1.5,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF9F9F9),
                        ),
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
                        onTap: () {
                          context.pushRoute(HistoryRoute());
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
                              colors: [Color(0xFF00BC7D), Color(0xFF00BBA7)],
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
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
