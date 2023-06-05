import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ArchitectformController extends GetxController {
  XFile? idProofimg;

  XFile? idRegnProofimg;

  String idProofImageUrl = '';

  String regnidProofImageUrl = '';

  fetchIdProofImg() async {
    print('fetchidProofimg');
    final uniqueProductImageName = DateTime.now().microsecondsSinceEpoch;
    idProofimg = await ImagePicker().pickImage(source: ImageSource.gallery);
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages =
        referenceRoot.child('Architect/IdProof/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uniqueProductImageName.toString());
    // log(uniqueProductImageName.toString());
    if (idProofimg == null) {
      return;
    }
    try {
      await referenceImageToUpload.putFile(File(idProofimg!.path));

      idProofImageUrl = await referenceImageToUpload.getDownloadURL();
      // log(useridProofimg);
    } catch (e) {
      // log(e.toString());
      if (kDebugMode) {
        print(e);
      }
    }

    // update();
    refresh();
  }

  addPersonalDetails(
    uid,
    String designation,
    String fullName,
    String mobileNo,
    String whatsappNo,
    String idProof,
    String email,
    String adress,
    String town,
    String pincode,
    String state,
  ) async {
    await FirebaseFirestore.instance
        .collection("ArchitectData")
        .doc(uid)
        .update(
      {
        'personalDetails': {
          'designnation': designation,
          'fullName': fullName,
          'idProof': idProof,
          'idProofImg': idProofImageUrl,
          'mobileNo': mobileNo,
          'whatsappNo': whatsappNo,
          'emailId': email,
          'adress': adress,
          'town': town,
          'pincode': pincode,
          'state': state,
          'id': DateTime.now().millisecondsSinceEpoch,
        }
      },
    );
    // _cartController.getuserCartItem();

    // FirebaseFirestore.instance.collection("ArchitectData").doc(uid).update({
    //   'personalDetails': FieldValue.arrayUnion([
    //     {
    //       'designnation': designation,
    //       'fullName': fullName,
    //       'idProof': idProof,
    //       'idProofImg': idProofImg,
    //       'mobileNo': mobileNo,
    //       'whatsappNo': whatsappNo,
    //       'emailId': email,
    //       'adress': adress,
    //       'town': town,
    //       'pincode': pincode,
    //       'state': state,
    //       'id': DateTime.now().millisecondsSinceEpoch,
    //     }
    //   ])
    // });

    update();
  }

  addServicerateDetails(
    uid,
    Map serviceType,
    Map serviceAmount,
  ) async {
    await FirebaseFirestore.instance
        .collection("ArchitectData")
        .doc(uid)
        .update(
      {
        'serviceRateTypeList': serviceType,
        'serviceRateamountList': serviceAmount,
      },
    );

    update();
  }

  fetchRegnIdProofImg() async {
    // print('fetchidProofimg');
    final uniqueProductImageName = DateTime.now().microsecondsSinceEpoch;
    idRegnProofimg = await ImagePicker().pickImage(source: ImageSource.gallery);
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages =
        referenceRoot.child('Architect/IdProof/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uniqueProductImageName.toString());
    // log(uniqueProductImageName.toString());
    if (idRegnProofimg == null) {
      return;
    }
    try {
      await referenceImageToUpload.putFile(File(idRegnProofimg!.path));

      regnidProofImageUrl = await referenceImageToUpload.getDownloadURL();
      // log(useridProofimg);
    } catch (e) {
      // log(e.toString());
      if (kDebugMode) {
        // print(e);
      }
    }

    // update();
    refresh();
  }

  addOfficeDetails(
    uid,
    String officeName,
    String regnProof,
    String googletag,
    String email,
    String adress,
    String town,
    String pincode,
    String state,
  ) async {
    await FirebaseFirestore.instance
        .collection("ArchitectData")
        .doc(uid)
        .update({
      'officeDetails': {
        'officeName': officeName,
        'regnProof': regnProof,
        'regnProofImg': regnidProofImageUrl,
        'googletag': googletag,
        'googletagfile': 'googletagfile',
        'email': email,
        'adress': adress,
        'town': town,
        'pincode': pincode,
        'state': state,
        'id': DateTime.now().millisecondsSinceEpoch,
      }
    });

    update();
  }
}
