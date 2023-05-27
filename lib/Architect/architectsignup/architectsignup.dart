import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../../controller/ArchitectSignupController.dart';

class ArchitectSignupPage extends StatelessWidget {
  ArchitectSignupPage({super.key});

  final formKey = GlobalKey<FormState>();

  final mobilecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();

  // final passwordcontroller = TextEditingController();
  final getcontroller = Get.put(ArchitectSignupController());

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                height: 370.w,
                child: Image.asset(
                  'asset/women.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.w),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  heigh20,
                  heigh20,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: kashcolor),
                    child: TextFormField(
                      style: normal18,

                      controller: namecontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.w),
                        labelText: 'Name',

                        hintText: 'Enter Name Here',
                        hintStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                        border: InputBorder.none,

                        // border: const OutlineInputBorder(),
                        // labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Name';
                        }

                        return null;
                      },
                      // onSaved: (value) => email = value!.trim(),
                    ),
                  ),
                  heigh10,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: kashcolor),
                    child: TextFormField(
                      style: normal18,

                      controller: emailcontroller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.w),
                        labelText: 'Email Adress',

                        hintText: 'Enter Email Here',
                        hintStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                        labelStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                        border: InputBorder.none,

                        // border: const OutlineInputBorder(),
                        // labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                                r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      // onSaved: (value) => email = value!.trim(),
                    ),
                  ),
                  heigh10,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: kashcolor),
                    child: TextFormField(
                      style: normal18,

                      controller: mobilecontroller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.w),
                          hintText: 'Enter Mobile Number Here',
                          labelText: 'Mobile Number',
                          border: InputBorder.none,

                          // border: const OutlineInputBorder(),
                          // labelText: 'Email',
                          hintStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Please enter a valid mobile number';
                        }
                        return null;
                      },
                      // onSaved: (value) => mobile = value!.trim(),
                    ),
                  ),
                  heigh10,
                  GestureDetector(
                    onTap: () => _submit(context),
                    child: Container(
                      height: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: kprimarycolor),
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(color: kwhitecolor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  heigh10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' Already have an account? ',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: kblackcolor),
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(
                          ' Login',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: kprimarycolor),
                        ),
                      ),
                    ],
                  ),
                  heigh10,
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _submit(context) {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();

       showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            return Center(
                child: const CircularProgressIndicator(
              color: kprimarycolor,
            ));
          });
      // TODO: Perform login with _mobile and _password
    getcontroller.SentOtpforsignup(context, mobilecontroller.text,
          emailcontroller.text, namecontroller.text);
    }
  }
}