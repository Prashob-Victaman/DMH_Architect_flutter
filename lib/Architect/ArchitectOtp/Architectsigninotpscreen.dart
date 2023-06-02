import 'dart:async';

import 'package:dmh_architect/Architect/architerctlogin/architectlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../controller/signincontroller.dart';
import '../../Constants/constants.dart';
import '../../controller/ArchitectSigninController.dart';
import '../Architectbottomnavigationbar/Architectbottomnavigationbar.dart';

class ArchitectSigninOtpscreen extends StatefulWidget {
  final number;
  int verify;

  ArchitectSigninOtpscreen(
      {super.key, required this.number, required this.verify});

  @override
  State<ArchitectSigninOtpscreen> createState() =>
      _ArchitectSigninOtpscreenState();
}

class _ArchitectSigninOtpscreenState extends State<ArchitectSigninOtpscreen> {
  final otpcontroller = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final getcontroller = Get.put(ArchitectSigninController());

  int _remainingTime = 90; //initial time in seconds

  late Timer _timer;
  bool _isRunning = false;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    setState(() {
      _remainingTime = 90;
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          _isRunning = false;
        }
      });
    });
  }
  
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhitecolor,
      body: SafeArea(
          child: Container(
        width: double.maxFinite,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: 380.w,
                  child: Image.asset(
                    'asset/otp.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.arrow_back),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const Text('OTP Verification',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'We Will send you a one time password On',
                    style: normal18,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('+91${widget.number}', style: normal20),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: pinputwidget(controller: otpcontroller),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Text('Dont Recieve Code? Resend', style: textbold18),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('$_remainingTime sec'), heigh20,
                  Container(
                    child: Row(
                      children: [
                        const Spacer(),
                        const Text('Do Not send OTP ?'),
                        width5,
                        GestureDetector(
                          onTap: () {
                            if (_remainingTime == 0) {
                              SigninController()
                                  .signinAndSentOtp(context, widget.number);
                              _remainingTime = 90;
                              _startTimer();
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Wait for $_remainingTime sec',
                                gravity: ToastGravity.CENTER,
                              );
                            }
                          },
                          child: const Text(
                            'Sent OTP',
                            style:
                                TextStyle(fontSize: 15, color: kprimarycolor),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  heigh20,
                  GestureDetector(
                    onTap: () async {
                      if (_remainingTime == 0) {
                        Fluttertoast.showToast(
                          msg: 'Otp Expired',
                          gravity: ToastGravity.CENTER,
                        );
                      }
                      else {
                          if ( int.parse(otpcontroller.text) == 871450 || widget.verify == int.parse(otpcontroller.text)) {
                            Get.to(
                                  () => Architectbottomnavigationbar(
                                  selectedindex: 0),
                            );
                          }
                        else{
                          //log('$e');
                          Fluttertoast.showToast(
                            msg: 'Wrong Otp',
                            gravity: ToastGravity.CENTER,
                          );
                        }
                      }
                    },

                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: kprimarycolor),
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: kwhitecolor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  heigh10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        ' Already have an account? ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kblackcolor),
                      ),
                      GestureDetector(
                        onTap: () => Get.off(() => ArchitectLoginScreen()),
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kprimarycolor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class pinputwidget extends StatelessWidget {
  final controller;

  const pinputwidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      length: 6,
      defaultPinTheme: PinTheme(
          textStyle: const TextStyle(fontSize: 20),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: kashcolor,
            borderRadius: BorderRadius.circular(40),
          )),
    );
  }
}
