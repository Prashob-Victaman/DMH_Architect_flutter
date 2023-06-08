import 'package:dmh_architect/Architect/ArchitectProfile/profileServicerates.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/widgets/architectprofilename.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/widgets/architectprofilewidgets.dart';
import 'package:dmh_architect/Architect/architerctlogin/architectlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../../controller/signupcontroller.dart';
import 'ArchitectMyDesign.dart';
import 'architectProfile.dart';

class ArchitectProfilePage extends StatelessWidget {
  ArchitectProfilePage({super.key});

  // final getcontroller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.all(10.w),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Profile',
                  style: bold20,
                ),
              ),
              heigh10,
              const architectprofilename(),
              heigh20,
              Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.circular(5.w),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        spreadRadius: .1,
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(137, 184, 184, 184),
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.0))
                  ],
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => ArchitectProfile()),
                      child: architectprofilewidgets(
                          icon: Icon(Icons.account_circle_outlined,
                              color: kbluecolor, size: 20.w),
                          title: 'My Account',
                          subtitle: 'Make Changes to your account',
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: 15.w, color: kgreycolor)),
                    ),
                    heigh20,
                    GestureDetector(
                      onTap: () => Get.to(() => ArchitectMyDesign()),
                      child: architectprofilewidgets(
                          icon: Icon(Icons.category,
                              color: kbluecolor, size: 20.w),
                          title: 'My Designs',
                          subtitle: 'Manage your Designs',
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: 15.w, color: kgreycolor)),
                    ),
                    heigh20,
                    GestureDetector(
                      onTap: () => Get.to(() => ProfileServiceRate()),
                      child: architectprofilewidgets(
                          icon: Icon(Icons.currency_rupee,
                              color: kbluecolor, size: 20.w),
                          title: 'Service Rates',
                          subtitle: 'Manage your Service Rates',
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: 15.w, color: kgreycolor)),
                    ),
                    heigh20,
                    GestureDetector(
                      onTap: () => showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: EdgeInsets.all(0.w),
                            title: Container(
                              height: 114.w,
                              width: 282.w,
                              child: Column(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      height: 84.w,
                                      child: Text(
                                        'Are you sure you want to logout',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: kblackcolor,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Spacer(),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await FirebaseAuth.instance.signOut();
                                          Get.offAll(
                                              () => ArchitectLoginScreen());
                                        },
                                        child: Container(
                                          height: 30.w,
                                          width: 141.w,
                                          decoration: BoxDecoration(
                                              color: kprimarycolor),
                                          child: Center(
                                              child: Text(
                                            'Yes',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: kwhitecolor),
                                          )),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Container(
                                          height: 30.w,
                                          width: 141.w,
                                          decoration: BoxDecoration(
                                              color: kwhitecolor,
                                              border: Border.all(
                                                  color: kprimarycolor)),
                                          child: Center(
                                              child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: kprimarycolor),
                                          )),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      child: architectprofilewidgets(
                          icon:
                              Icon(Icons.login, color: kbluecolor, size: 20.w),
                          title: 'Log out',
                          subtitle: 'Further secure your account for safety',
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: 15.w, color: kgreycolor)),
                    )
                  ],
                ),
              ),
              heigh10,
              Container(
                child: Text(
                  'More',
                  style: bold13,
                ),
              ),
              heigh10,
              Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: kwhitecolor,
                  borderRadius: BorderRadius.circular(5.w),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        spreadRadius: .1,
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(137, 184, 184, 184),
                        blurRadius: 5.0,
                        offset: Offset(0.0, 0.0))
                  ],
                ),
                child: Column(
                  children: [
                    architectprofilewidgetdown(
                        icon: Icon(Icons.notifications,
                            color: kbluecolor, size: 20.w),
                        title: 'Help & Support',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.w,
                          color: kgreycolor,
                        )),
                    heigh20,
                    architectprofilewidgetdown(
                        icon: Icon(Icons.account_circle_outlined,
                            color: kbluecolor, size: 20.w),
                        title: 'About App',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15.w,
                          color: kgreycolor,
                        )),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
