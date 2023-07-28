import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/model/notificationModel.dart';
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
  int exteriorListCount = 3;
  int floorListCount = 3;
  int planningGridCount = 1;

  List<bool> exteriorisLoading = List.filled(9, false);
  List<bool> floorisLoading = List.filled(9, false);
  List<bool> workingDrawingsisLoading = List.filled(6, false);

  List<String?> exteriorimgurlList = List<String?>.filled(9, null);

  List<XFile?> exteriorimgXfileList = List<XFile?>.filled(9, null);

  List<String?> floorimgurlList = List<String?>.filled(9, null);

  List<XFile?> floorimgXFileList = List<XFile?>.filled(9, null);

  final exteriorDesignNameControllerList =
      List.generate(9, (_) => TextEditingController());

  final floorDesignNameControllerList =
      List.generate(9, (_) => TextEditingController());

  final planingFileNameControllerList =
      List.generate(6, (_) => TextEditingController());

  final planingFilePriceControllerList =
      List.generate(6, (_) => TextEditingController());

  List<String?> planingImageUrl = List<String?>.filled(6, null);

  List<FilePickerResult?> planningImgs =
      List<FilePickerResult?>.filled(6, null);

  // final List exteriorDesignNameControllerList = [
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  // ];

  addworkingDrawings(count) {
    if (count == 1) {
      planningGridCount++;
    } else {
      planningGridCount--;
    }
    refresh();
  }

  clearingfields() {
    for (var i = 0; i < 9; i++) {
      floorisLoading[i] = false;

      exteriorisLoading[i] = false;
      exteriorimgurlList[i] = null;

      exteriorimgXfileList[i] = null;

      floorimgurlList[i] = null;

      floorimgXFileList[i] = null;

      exteriorDesignNameControllerList[i].clear();
      floorDesignNameControllerList[i].clear();
    }

    for (var i = 0; i < 6; i++) {
      workingDrawingsisLoading[i] = false;
      planingFileNameControllerList[i].clear();

      planingFilePriceControllerList[i].clear();

      planingImageUrl[i] = null;
      planningImgs[i] = null;
    }
  }

  changefloorisLoading(int index) {
    floorisLoading[index] = !floorisLoading[index];
    refresh();
  }

  changeexteriorisLoading(int index) {
    exteriorisLoading[index] = !exteriorisLoading[index];
    refresh();
  }

  changeworkingDetailsisLoading(int index) {
    workingDrawingsisLoading[index] = !workingDrawingsisLoading[index];
    refresh();
  }

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
      exteriorListCount++;
      // exteriorimgcount + 1;
    } else {
      exteriorListCount--;
      // exteriorimgcount - 1;
    }
    print(exteriorListCount);
    refresh();
  }

  changefloortextControllercount(int value) {
    if (value == 1) {
      floorListCount++;
      // floorimgcount + 1;
    } else {
      floorListCount--;
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
    // print(index);

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
      changeexteriorisLoading(buttonIndex);
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
      changefloorisLoading(buttonindex);

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

  fetchPlanningImg(buttonIndex) async {
    final uploadimgkey = DateTime.now().microsecondsSinceEpoch;

    planningImgs[buttonIndex] = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages =
        referenceRoot.child('adminuploadDesign/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uploadimgkey.toString());

    // Uint8List uploadfile = result.files.single.bytes;

    print('uploadimg file called');
    if (planningImgs[buttonIndex] == null) {
      changeworkingDetailsisLoading(buttonIndex);
      return;
    }
    // planningImgs[buttonIndex] = planningImgs[buttonIndex].files.single.bytes;

    try {
      await referenceImageToUpload
          .putFile(File(planningImgs[buttonIndex]!.paths[0]!));

      planingImageUrl[buttonIndex] =
          await referenceImageToUpload.getDownloadURL();
      print('imageurl $planingImageUrl');
    } catch (e) {
      // log(e.toString());F
    }
    print('done');
    refresh();
  }

  Future uploadDesignDataFromAdmin(
      {required String adminUid,
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
      required String architectName}) async {
    final docUrl =
        FirebaseFirestore.instance.collection('DesignDataFromAdmin').doc();

    final designData = designDataFromAdmin(
        floordetails: floordetails,
        uploadedBy: architectName,
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

    await FirebaseFirestore.instance
        .collection('ArchitectData')
        .doc(uploadedUserUid)
        .update({
      'myDesigns': FieldValue.arrayUnion([json])
    });

    final docNotifcaton =
        FirebaseFirestore.instance.collection('Notifications').doc();
    final notificationData = notificationModel(
        time: DateTime.now(),
        imgUrl: exteriorImageList[0],
        title: '${architectName} Added New Design',
        sortid: DateTime.now().millisecondsSinceEpoch,
        uid: docUrl.id);

    await docNotifcaton.set(notificationData.toJson());
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
