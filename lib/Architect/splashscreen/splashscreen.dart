import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/architerctlogin/architectlogin.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../Constants/constants.dart';
import '../Architectbottomnavigationbar/Architectbottomnavigationbar.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLoginData();
    // goto(context);
    super.initState();
  }

  checkLoginData() async {
    var currentUser = FirebaseAuth.instance.currentUser?.uid;
    if (currentUser != null) {
      // print(currentUser);
      // check User data
        // check architect data
        var ArchitectDocRef = FirebaseFirestore.instance
            .collection('ArchitectData')
            .doc(currentUser);
        var doc = await ArchitectDocRef.get();
        if (!doc.exists) {
          // print('Architect not found!');
        } else {
          Get.offAll(() => Architectbottomnavigationbar(selectedindex: 0));
        }
    } else {
      goto(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    //gotoLogin(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: kashcolor),
          child: Center(
            child: Container(
              // width: MediaQuery.of(context).size.width - 50,
              width: 330.w,
              child: Image.asset('asset/Logo-03.png'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> goto(context) async {
    await Future.delayed(Duration(seconds: 4));
    Get.offAll(() => ArchitectLoginScreen());
  }
}
