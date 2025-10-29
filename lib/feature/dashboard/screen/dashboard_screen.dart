import 'package:auto_route/auto_route.dart';
import 'package:bank_sampah_app/core/constants/app_color.dart';
import 'package:bank_sampah_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const String id = '/dashboard';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.white.withValues(alpha: 0.9),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * 0.27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF50C878).withValues(alpha: 0.7),
                    Colors.teal,
                  ],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                          BorderSide(color: Colors.white, width: 2),
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
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.workspace_premium_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: height * 0.01,
                    children: [
                      Row(
                        spacing: width * 0.04,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF50C878).withValues(alpha: 0.7),
                                  Colors.teal,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.coins,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Points',
                                style: AppTextStyle.bold(
                                  fontSize: AppFontSize.h3,
                                  color: Colors.white,
                                ),
                              ),

                              Text(
                                '2,450',
                                style: AppTextStyle.bold(
                                  fontSize: AppFontSize.h2,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.055),
                  Text('Quick Actions'),
                  SizedBox(height: height * 0.01),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: 4,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 10,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(
                                          0xFF50C878,
                                        ).withValues(alpha: 0.7),
                                        Colors.teal,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.trashCan,
                                    color: Colors.white,
                                  ),
                                ),
                                Text('Deposit Waste'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Activity'),
                      TextButton(onPressed: () {}, child: Text('View All')),
                    ],
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 3,
                        margin: EdgeInsets.only(bottom: 20),
                        child: ListTile(
                          leading: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withValues(alpha: 0.3),
                            ),
                            child: Icon(
                              FontAwesomeIcons.trashCan,
                              color: Colors.green,
                              size: 15,
                            ),
                          ),
                          title: Text('Plastic Bottles'),
                          subtitle: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: width * 0.01,
                            children: [
                              Text('2.5kg'),
                              Text('•'),
                              Text('2 hours ago'),
                            ],
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            spacing: 2,
                            children: [
                              Text(
                                '+215',
                                style: AppTextStyle.medium(
                                  color: AppColor.secondary,
                                  fontSize: AppFontSize.body,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text('Completed'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
