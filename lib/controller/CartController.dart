import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Constants/constants.dart';

class CartController extends GetxController {


    RxDouble totalprice = 0.0.obs;
  RxString total = '0'.obs;


  Future addToCart({
    required String ProductUid,
    required String userid,
    required String imgUrl,
    required String houseType,
    required String designType,
    required String dimensions,
    required String amount,
  }) async {
    await FirebaseFirestore.instance.collection("UserData").doc(userid).update({
      'cart': FieldValue.arrayUnion([
        {
          'uid': DateTime.now().millisecondsSinceEpoch,
          'userUid': userid,
          'productUid': ProductUid,
          'imgUrl': imgUrl,
          'houseType': houseType,
          'designType': designType,
          'dimensions': dimensions,
          'amount': amount,
        }
      ])
    });
    Fluttertoast.showToast(
      msg: 'Added to Cart',
      fontSize: 20.sp,
      backgroundColor: kprimarycolor,
      textColor: kwhitecolor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void deleteCartElement(String documentId, String arrayFieldName, int index) {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(
          FirebaseFirestore.instance.collection('UserData').doc(documentId));
      List<dynamic> array = snapshot.get(arrayFieldName) ?? [];

      if (index >= 0 && index < array.length) {
        array.removeAt(index);
        transaction.update(snapshot.reference, {arrayFieldName: array});
      }
    });
    Fluttertoast.showToast(
      msg: 'Deleted',
      fontSize: 15.sp,
      backgroundColor: kprimarycolor,
      textColor: kwhitecolor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  
  // totalPrice(CartList, length) {
  //   totalprice.value = 0.0;
  //   // final a = userCart!.map((e) => e['product_price']);
  //   // final tota = a.map((e) => totalprice.value += e);
  //   // total = '${tota.last}';
  //   for (var i = 0; i < length; i++) {
  //     totalprice.value += CartList[i]['amount'];
  //   }

  //   log('${totalprice.value} list total price print ..................>>>>>>>>>>>>>>>>');

  //   update(['totalprice']);
  // }
}
