import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Architect/ArchitectOtp/Architectsigninotpscreen.dart';

class ArchitectSigninController extends GetxController {
  signinAndSentOtp(context, mobile) async {
    if (mobile != '1000010000') {
      var rnd = Random();
      var next = rnd.nextDouble() * 1000000;
      while (next < 100000) {
        next *= 10;
      }
      int otp = next.toInt();

      var url = Uri.parse('https://enterprise.smsgupshup.com/GatewayAPI/rest');

      var queryParams = {
        'method': 'SendMessage',
        'send_to': '91${mobile}',
        'msg': 'Dear Customer, Your OTP for Designmyhouse is $otp',
        'msg_type': 'TEXT',
        'userid': '2000219184',
        'auth_scheme': 'plain',
        'password': 'pi8IGAszH',
        'v': '1.1',
        'format': 'text',
      };

      var uri = url.replace(queryParameters: queryParams);

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        // Request successful, process the response

        Get.to(ArchitectSigninOtpscreen(
          number: mobile,
          verify: otp,
          // email: email,
        ));

        Fluttertoast.showToast(msg: 'OTP sent successfully');

        // print('OTP sent successfully');
        // print(response.body);
      } else {
        // Request failed

        Fluttertoast.showToast(msg: 'Failed to send OTP');

        print('Failed to send OTP');
        print('Status Code: ${response.statusCode}');
      }
    }
  }

  void Architectsignin(context, String email, mobilenumber, auth) async {
    print(email);
    print(mobilenumber);

    await auth
        .signInWithEmailAndPassword(email: email, password: mobilenumber)
        .then((uid) async {
      var userDocRef = FirebaseFirestore.instance
          .collection('ArchitectData')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      var doc = await userDocRef.get();

      print("done");
      print(FirebaseAuth.instance.currentUser!.uid);
      if (!doc.exists) {
        FirebaseAuth.instance.signOut();
        Fluttertoast.showToast(msg: "No user found");
      } else {
        // Fluttertoast.showToast(msg: "Login Sussesfull");

        signinAndSentOtp(context, mobilenumber);

        // Get.to(() => bottomnavigationbar(
        //       selectedindex: 0,
        //     ));
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  // void Architectsignin(context, String email, String password, auth) async {
  //   await auth
  //       .signInWithEmailAndPassword(email: email, password: password)
  //       .then((uid) async {
  //     var userDocRef = FirebaseFirestore.instance
  //         .collection('ArchitectData')
  //         .doc(FirebaseAuth.instance.currentUser!.uid);
  //     var doc = await userDocRef.get();

  //     // print("done");
  //     // print(FirebaseAuth.instance.currentUser!.uid);
  //     if (!doc.exists) {
  //       // FirebaseAuth.instance.signOut();
  //       Fluttertoast.showToast(msg: "No user found");
  //     } else {
  //       Fluttertoast.showToast(msg: "Login Sussesfull");
  //       Get.to(() => Architectbottomnavigationbar(
  //             selectedindex: 0,
  //           ));

  //       // Fluttertoast.showToast(msg: "Login Sussesfull");
  //       // Get.to(() => bottomnavigationbar(
  //       //   selectedindex: 0,
  //       // ));
  //     }
  //   }).catchError((e) {
  //     Fluttertoast.showToast(msg: e!.message);
  //   });
  // }
}
