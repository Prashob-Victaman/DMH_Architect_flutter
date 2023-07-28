// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class PaymentController extends GetxController {
//   var razorpay = Razorpay();

//   void onInit() {
//     razorpay.on(
//         Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     razorpay.on(
//         Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     razorpay.on(
//         Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     super.onInit();
//   }

//   @override
//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//     // Do something when payment succeeds
//     await FirebaseFirestore.instance
//         .collection("UserData")
//         .doc('2yv4c5BZSBSkEZGQjf7XgptFiBY2')
//         .update({
//       'paymentdetails': FieldValue.arrayUnion([
//         {
//           'orderId': 'DMH${DateTime.now().millisecondsSinceEpoch}',
//           'dateTime': DateTime.now().toString(),
//           'amount': 3,
//           'razorpayId': 'response.signature',
//         }
//       ])
//     });

//     await FirebaseFirestore.instance
//         .collection("UserData")
//         .doc('2yv4c5BZSBSkEZGQjf7XgptFiBY2')
//         .update({
//       'myDesigns': FieldValue.arrayUnion([
//         {
//           'uid': DateTime.now().millisecondsSinceEpoch,
//           'orderId': DateTime.now().toString(),
//           'designName': 'designName',
//           'designUid': 'designUid',
//           'imagUrl': 'imgUrl',
//         }
//       ])
//     });

//     var DocRef = FirebaseFirestore.instance.collection("PaymentDetails").doc(
//         '${DateFormat('MMM').format(DateTime.now())}_${DateTime.now().year}');
//     var doc = await DocRef.get();
//     if (!doc.exists) {
//       await DocRef.set({
//         'payments': FieldValue.arrayUnion([
//           {
//             'name': '',
//             'amount': '',
//             'date': '',
//             'transaction': '',
//           }
//         ])
//       });
//     } else {
//       await DocRef.update({
//         'payments': FieldValue.arrayUnion([
//           {
//             'name': 'aa',
//             'amount': 232,
//             'date': Timestamp.now(),
//             'transaction': 'response.paymentId',
//           }
//         ])
//       });
//     }

//     //Get.to(PaymentSuccess());
//     // productUidList.clear();
//   }
// // log(response.signature.toString());

//   void _handlePaymentError(PaymentFailureResponse response) {
//     // Do something when payment fails
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     // Do something when an external wallet was selected
//   }
// }
