import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/constants/app_style.dart';
import 'package:bank_sampah_app/core/constants/export.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});
  static const String id = '/history';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF50C878).withValues(alpha: 0.7),
                    Colors.teal,
                  ],
                  center: Alignment.topLeft,
                  radius: 1.5,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.circleChevronLeft),
                    style: IconButton.styleFrom(iconSize: 36),
                    color: Colors.white,
                  ),
                  title: Text(
                    'Transaction History',
                    style: AppTextStyle.regular(
                      color: AppColor.background,
                      fontSize: AppFontSize.h3,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: height * 0.13,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(25),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 24,
                          vertical: 24,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: width * 0.05,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('4'), Text('Completed')],
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Divider(
                                color: Colors.grey.shade300,
                                thickness: 2,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('1'), Text('Pending')],
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Divider(
                                color: Colors.grey.shade300,
                                thickness: 2,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('885'), Text('Total Points')],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
