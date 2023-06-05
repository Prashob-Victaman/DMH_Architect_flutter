import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../model/designDataFromAdmin.dart';

class ArchitectAddDesignController extends GetxController {
  int selectedHouseType = 0;
  int selectedDesignTypeCheckBox = 0;
  int selectedHouseFacingCheckbox = 0;
  int selectedHouseFloorsCheckbox = 0;
  

  // bool isLoading = false;

  // List<bool> isLoading = List<bool>.filled(9, false);

  List<bool> exteriorisLoading = List.filled(9, false);
  List<bool> floorisLoading = List.filled(9, false);

  List<String?> exteriorimgurlList = List<String?>.filled(9, null);

  List<XFile?> exteriorimgXfileList = List<XFile?>.filled(9, null);

  List<String?> floorimgurlList = List<String?>.filled(9, null);

  List<XFile?> floorimgXFileList = List<XFile?>.filled(9, null);

  // final List exteriorDesignNameControllerList = [
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  // ];



  changefloorisLoading(bool passedisLoading, int index) {
    floorisLoading[index] = passedisLoading;
    refresh();
  }

   changeexteriorisLoading(bool passedisLoading, int index) {
    exteriorisLoading[index] = passedisLoading;
    refresh();
  }


  final exteriorDesignNameControllerList =
      List.generate(3, (_) => TextEditingController());

  final floorDesignNameControllerList =
      List.generate(3, (_) => TextEditingController());

  // final List floorDesignNameControllerList = [
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  // ];

  // String? flooImgDataImgurlOne;
  // Uint8List? flooImgDataImgOne;

  // String? flooImgDataImgurlTwo;
  // Uint8List? flooImgDataImgTwo;

  // String? flooImgDataImgurlThree;
  // Uint8List? flooImgDataImgThree;

  String? Uploadpdfurl;
  Uint8List? Uploadpdf;

  changetextControllercount(int value) {
    if (value == 1) {
      exteriorDesignNameControllerList.add(TextEditingController());
      // exteriorimgcount + 1;
    } else {
      exteriorDesignNameControllerList.removeLast();
      // exteriorimgcount - 1;
    }
    refresh();
  }

  changefloortextControllercount(int value) {
    if (value == 1) {
      floorDesignNameControllerList.add(TextEditingController());
      // floorimgcount + 1;
    } else {
      floorDesignNameControllerList.removeLast();
      // exteriorimgcount - 1;
    }
    refresh();
  }

  addDesignHouseTYpe(index) {
    selectedHouseType = index;
    refresh();
  }

  DesignTypeCheckbox(index) {
    selectedDesignTypeCheckBox = index;

    refresh();
  }

  HouseFacingCheckbox(index) {
    selectedHouseFacingCheckbox = index;

    refresh();
  }

  HouseFloorsCheckbox(index) {
    selectedHouseFloorsCheckbox = index;

    refresh();
  }

  uploadexteriorimagefileOne(buttonIndex) async {
    final uploadimgkey = DateTime.now().microsecondsSinceEpoch;

    exteriorimgXfileList[buttonIndex] =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages =
        referenceRoot.child('adminuploadDesign/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uploadimgkey.toString());

    // Uint8List uploadfile = result.files.single.bytes;

    print('uploadimg file called');
    if (exteriorimgXfileList[buttonIndex] == null) {
      return;
    }
    try {
      await referenceImageToUpload
          .putFile(File(exteriorimgXfileList[buttonIndex]!.path));

      exteriorimgurlList[buttonIndex] =
          await referenceImageToUpload.getDownloadURL();
      print('imageurl $exteriorimgurlList[buttonIndex]');
    } catch (e) {
      // log(e.toString());F
    }

    refresh();
  }

  uploadfloorfileimage(buttonindex) async {
    final uploadimgkey = DateTime.now().microsecondsSinceEpoch;

    floorimgXFileList[buttonindex] =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages =
        referenceRoot.child('adminuploadDesign/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uploadimgkey.toString());

    // Uint8List uploadfile = result.files.single.bytes;
    //
    print('uploadimg file called');
    if (floorimgXFileList[buttonindex] == null) {
      return;
    }
    try {
      await referenceImageToUpload
          .putFile(File(floorimgXFileList[buttonindex]!.path));
      floorimgurlList[buttonindex] =
          await referenceImageToUpload.getDownloadURL();
      print('imageurl $floorimgurlList[buttonindex]');
    } catch (e) {
      // log(e.toString());F
    }
    refresh();
  }

  Future uploadDesignDataFromAdmin({
    required String adminUid,
    required List floordetails,
    required String projectDetails,
    required String designType,
    required String houseFacing,
    required String houseFloors,
    required String houseType,
    required Map<String, String> houseArea,
    required String accordingtoVastu,
    required String projectCost,
    required String discount,
    required String shortdescription,
    required String designprice,
    required String uploadedUserUid,
    required List planingFileNameList,
    required List planingFilePriceList,
    required List planingFileUrlList,
    required String estimatedConstructionCost,
    required String aproximateConstructionCost,
    required List exteriorImageList,
    required List exteriorImagetitleList,
    required List floorImageList,
    required List floorImagetitleList,
  }) async {
    final docUrl =
        FirebaseFirestore.instance.collection('DesignDataFromAdmin').doc();

    final designData = designDataFromAdmin(
        floordetails: floordetails,
        uploadedBy: uploadedUserUid,
        uid: docUrl.id,
        shortdescription: shortdescription,
        designprice: designprice,
        sortId: DateTime.now().millisecondsSinceEpoch,
        uploadedUserUid: uploadedUserUid,
        projectDetails: projectDetails,
        exteriorImageList: exteriorImageList,
        exteriorImagetitleList: exteriorImagetitleList,
        designType: designType,
        houseFacing: houseFacing,
        houseFloors: houseFloors,
        houseType: houseType,
        houseArea: houseArea,
        accordingtoVastu: accordingtoVastu,
        estimatedConstructionCost: estimatedConstructionCost,
        aproximateConstructionCost: aproximateConstructionCost,
        postedDate: DateTime.now(),
        visitors: 0,
        floorImageList: floorImageList,
        floorImagetitleList: floorImagetitleList,
        planingFileNameList: planingFileNameList,
        planingFilePriceList: planingFilePriceList,
        planingFileUrlList: planingFileUrlList);

    final json = designData.toJson();

    await docUrl.set(json);
  }

  buyorder(name, amount, mobilenumber, paymentmode, notes) async {
    var DocRef = FirebaseFirestore.instance.collection("OrderfromAdmin").doc(
        '${DateFormat('MMM').format(DateTime.now())}_${DateTime.now().year}');
    var doc = await DocRef.get();
    if (!doc.exists) {
      await DocRef.set({
        'payments': FieldValue.arrayUnion([
          {
            'name': name,
            'amount': amount,
            'mobilenumber': mobilenumber,
            'paymentmode': paymentmode,
            'date': Timestamp.now(),
            'notes': notes,
          }
        ])
      });
    } else {
      await DocRef.update({
        'payments': FieldValue.arrayUnion([
          {
            'name': name,
            'amount': amount,
            'mobilenumber': mobilenumber,
            'paymentmode': amount,
            'date': Timestamp.now(),
            'notes': notes,
          }
        ])
      });
    }
  }
}
