import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Architect/ArchitectForm/architect_presonal_details.dart';
import '../Architect/ArchitectOtp/ArchitectSignupotpscreen.dart';
import '../model/architectmodel.dart';

class ArchitectSignupController extends GetxController {
  SentOtpforsignup(context, mobile, email, name) async {
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

        Get.to(ArchitectSignupOtpscreen(
          number: mobile,
          verify: otp, email: email, name: name,
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

  void addarchitectsignupdata(
      context, auth, name, mobilenumber, email, signupemail) async {
    await auth
        .createUserWithEmailAndPassword(
            email: signupemail, password: mobilenumber)
        .then((value) =>
            {postDetailsToFirestore(context, name, mobilenumber, email, auth)})
        .catchError((e) {
      // Fluttertoast.showToast(msg: e);
      // print(e);
    });
  }

  postDetailsToFirestore(context, name, mobilenumber, email, auth) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    String uid = user!.uid;

    final docuser = firebaseFirestore.collection("ArchitectData").doc(uid);

    final users = ArchitectsignupData(
        serviceRateTypeList: {},
        serviceRateamountList: {},
        sortId: DateTime.now().millisecondsSinceEpoch,
        myDesigns: [],
        gender: '',
        designation: 'architect',
        uid: docuser.id,
        name: name,
        email: email,
        mobilenumber: mobilenumber,
        personalDetails: {},
        officeDetails: {});

    final json = users.toJson();

    await docuser.set(json);

    Fluttertoast.showToast(msg: "Account Created Successfully ");
    Get.offAll(() => ArchitectPresonalDetails());
  }
  // SentOtpforArchitectsignup(context, mobile, email, name) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '+91$mobile',
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {},
  //     codeSent: (String verificationId, int? resendToken) {
  //       verify = verificationId;

  //       Get.to(ArchitectSignupOtpscreen(
  //         name: name,
  //         number: '+91$mobile',
  //         verify: verify,
  //         email: email,
  //       ));
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // addArchitectSignupData(
  //     context, auth, name, mobilenumber, firstName, email) async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = auth.currentUser;

  //   String uid = user!.uid;

  //   final docuser = firebaseFirestore.collection("ArchitectData").doc(uid);

  //   final users = ArchitectsignupData(
  //       designation: 'architect',
  //       uid: docuser.id,
  //       name: name,
  //       email: email,
  //       mobilenumber: mobilenumber,
  //       personalDetails: [],
  //       officeDetails: []);
  //   final json = users.toJson();

  //   await docuser.set(json);

  //   Fluttertoast.showToast(msg: "Account Created Successfully ");
  //   Get.to(() => Architectbottomnavigationbar(selectedindex: 0));
  // }

  // XFile? idProofimg;

  // XFile? idRegnProofimg;

  // String idProofImageUrl = '';

  // String regnidProofImageUrl = '';

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
  //       Get.to(() => ArchitectSigninOtpscreen(number: number, verify: verify));

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
