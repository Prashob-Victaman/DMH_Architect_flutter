// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dmh_architect/Architect/Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';

// import '../model/usermodel.dart';

// class SignupController extends GetxController {
//   // static String verify = "";

//   postDetailsToFirestore(context, firstName, mobilenumber, email, auth) async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = auth.currentUser;
//     String uid = user!.uid;
//     final docuser = firebaseFirestore.collection("UserData").doc(uid);
//     final users = signupData(
//         sortId: DateTime.now().millisecondsSinceEpoch,
//         ProfileDetails: {
//           'firstName': firstName,
//           'lastName': '',
//           'mobileNumber': mobilenumber,
//           'gender': '',
//           'dateOfBirth': '',
//           'id': DateTime.now().millisecondsSinceEpoch,
//         },
//         myDesigns: [],
//         designation: 'user',
//         email: email,
//         uid: docuser.id,
//         cart: [],
//         paymentdetails: ['paymentdetails']);

//     final json = users.toJson();

//     await docuser.set(json);

//     Fluttertoast.showToast(msg: "Account Created Successfully ");
//     await Get.to(() =>Architectbottomnavigationbar(selectedindex: 0));
//   }
// }
