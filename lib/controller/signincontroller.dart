import 'dart:math';



import 'package:dmh_architect/Architect/ArchitectOtp/Architectsigninotpscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class SigninController extends GetxController {
  static String verify = "";

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

      //   http.post(url, headers: headers, body: body).then((response) {
      //     print(response.body);
      //     Get.to(SigninOtpscreen(
      //       number: '+91$mobile',
      //       verify: next,
      //       // email: email,
      //     ));
      //   }).catchError((error) {
      //     throw Exception(error);
      //   });
      // } else {
      //   Get.to(SigninOtpscreen(
      //     number: '+91$mobile',
      //     verify: 123456,
      //     // email: email,
      //   ));
      // }
      // print(mobile);
    }
  }

  void userSignin(context, String email, mobilenumber, auth) async {
    print(email);
    print(mobilenumber);
    signinAndSentOtp(context, mobilenumber);


    // await auth
    //     .signInWithEmailAndPassword(email: email, password: mobilenumber)
    //     .then((uid) async {
    //   var userDocRef = FirebaseFirestore.instance
    //       .collection('UserData')
    //       .doc(FirebaseAuth.instance.currentUser!.uid);
    //   var doc = await userDocRef.get();
    //
    //   print("done");
    //   print(FirebaseAuth.instance.currentUser!.uid);
    //   if (!doc.exists) {
    //     FirebaseAuth.instance.signOut();
    //     Fluttertoast.showToast(msg: "No user found");
    //   } else {
    //
    //   }
    //
    // }).catchError((e) {
    //   Fluttertoast.showToast(msg: e!.message);
    // });
  }
}