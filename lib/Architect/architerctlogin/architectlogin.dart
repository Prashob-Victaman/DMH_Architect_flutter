import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../../controller/ArchitectSigninController.dart';
import '../architectsignup/architectsignup.dart';

class ArchitectLoginScreen extends StatelessWidget {
  ArchitectLoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final getcontroller = Get.put(ArchitectSigninController());

  final auth = FirebaseAuth.instance;
  // TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
// final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
// userRef.get().then((doc) {
//   if (doc.exists) {
//     final isLoggedIn = doc.data()['isLoggedIn'] ?? false;
//     if (isLoggedIn) {
//       final storedUserType = doc.data()['userType'];
//       if (storedUserType == userType) {
//         print('User is already logged in as a $userType on this device.');
//       } else {
//         print('Another user is already logged in as a different type on this device.');
//       }
//     } else {
//       print('User is not logged in on this device.');
//     }
//   } else {
//     print('User document does not exist.');
//   }
// });

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: ListView(
        // padding: EdgeInsets.all(10.w),
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                height: 380.w,
                child: Image.asset(
                  'asset/women.png',
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
          // Spacer(),he
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 100.w,
                  ),
                  heigh10,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        color: kashcolor),
                    child: SizedBox(
                      child: TextFormField(
                        controller: mobilecontroller,
                        style: normal18,
                        textAlignVertical: TextAlignVertical.top,
                        // controller: mobilecontroller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.w),
                          labelText: 'Phone Number',

                          hintText: 'Enter Phone Number',
                          hintStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                          labelStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                          border: InputBorder.none,

                          // border: const OutlineInputBorder(),
                          // labelText: 'Email',
                        ),
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
                  ),
                  heigh20,
                  GestureDetector(
                    // onTap: () => Get.to(
                    //   Otpscreen(
                    //     number: '+91 9895468899',
                    //     verify: '',
                    //   )
                    //   ,
                    // ),
                    onTap: () => _submit(context),

                    child: Container(
                      height: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: kprimarycolor),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: kwhitecolor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  heigh20,
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
                        onTap: () => Get.to(ArchitectSignupPage()),
                        child: Text(
                          ' Register',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: kprimarycolor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
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
      // getcontroller.ArchitectsigninAndSentOtp(context, mobilecontroller.text);

      getcontroller.Architectsignin(context,
          '${mobilecontroller.text}@victamanarchitect.com', mobilecontroller.text, auth);
    }
  }
}
