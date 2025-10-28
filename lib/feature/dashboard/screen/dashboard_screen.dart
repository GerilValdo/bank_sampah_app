import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: RadialGradient(
                colors: [Color(0xFF50C878).withValues(alpha: 0.7), Colors.teal],
                center: Alignment.topLeft,
                radius: 2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.06,
              vertical: height * 0.05,
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.webp'),
                      ),
                    ),
                  ),
                  title: Text('Welcome back,'),
                  subtitle: Text('John Doe'),
                  trailing: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                    child: Icon(
                      Icons.workspace_premium_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.15,
                  child: Card(child: Column(
                    
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
