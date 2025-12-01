import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/router/app_router.dart';
import 'package:bank_sampah_app/feature/authentication/presentation/bloc/firebase_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FirebaseEmailVerificationScreen extends StatelessWidget {
  const FirebaseEmailVerificationScreen({super.key});
  static const String id = '/email-verification';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocListener<FirebaseAuthBloc, FirebaseAuthState>(
      listener: (context, state) {
        state.whenOrNull(
          emailVerified: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Email verified 🎉")));

            // Setelah verifikasi, user diarahkan ke login / main
            context.router.replaceAll([const FirebaseLoginRoute()]);
          },
          emailNotVerified: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email not verified yet."),
                backgroundColor: Colors.orange,
              ),
            );
          },
          emailVerificationSent: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Verification email sent again."),
                backgroundColor: Colors.green,
              ),
            );
          },
        );
      },

      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.08,
            vertical: height * 0.12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.mark_email_read_outlined,
                size: width * 0.25,
                color: const Color(0xFF009966),
              ),

              SizedBox(height: height * 0.03),

              Text(
                "Verify Your Email",
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF006045),
                ),
              ),

              SizedBox(height: height * 0.015),

              Text(
                "A verification link has been sent to your email.\nPlease check your inbox and click the link to continue.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: width * 0.035,
                  color: Colors.grey[700],
                ),
              ),

              SizedBox(height: height * 0.06),

              /// CHECK VERIFICATION BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<FirebaseAuthBloc>().add(
                      const FirebaseAuthEvent.checkEmailVerification(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00BC7D),
                    padding: EdgeInsets.symmetric(vertical: height * 0.018),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "I Have Verified",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              /// RESEND EMAIL BUTTON
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    context.read<FirebaseAuthBloc>().add(
                      const FirebaseAuthEvent.resendEmailVerification(),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: height * 0.018),
                    side: const BorderSide(color: Color(0xFF009966)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Resend Email",
                    style: TextStyle(
                      color: Color(0xFF009966),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.04),

              TextButton(
                onPressed: () {
                  context.router.replace(const FirebaseLoginRoute());
                },
                child: const Text(
                  "Back to Login",
                  style: TextStyle(color: Color(0xFF009966), fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
