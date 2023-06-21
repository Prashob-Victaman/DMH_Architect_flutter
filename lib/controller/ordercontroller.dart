import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  // List workingdetailsbool = [false, false, false, false, false, false];

  List<bool> workingdetailsbool = List<bool>.filled(6, false);
  List<bool> seereviewsbool = List<bool>.filled(6, false);

  // List<FilePickerResult?> flooplan =
  //     List<FilePickerResult?>.filled(1, null);

  // FilePickerResult? flooplan = null;

  // String? floorplanUrl = null;

  // List floorplanUrl =[null, null, null];

  List<FilePickerResult?> flooplan = List.filled(9, null);

  List<String?> floorplanUrl = List.filled(9, null);

  // List<String?> floorplanUrl = List<String?>.filled(6, null);

  seeWorkingDetails(index) {
    if (workingdetailsbool[index] == false) {
      workingdetailsbool[index] = true;
    } else {
      workingdetailsbool[index] = false;
    }
    if (seereviewsbool[index] == false) {
      seereviewsbool[index] = true;
    } else {
      seereviewsbool[index] = false;
    }

    // seereviewDetails(index);
    refresh();
  }

  chooseArchitect() {}

  fetchPlanningfile(index) async {
    final uploadimgkey = DateTime.now().microsecondsSinceEpoch;

    flooplan[index] = await FilePicker.platform.pickFiles(
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

    if (flooplan == null) {
      return;
    }
    // flooplan = flooplan.files.single.bytes;

    try {
      await referenceImageToUpload.putFile(File(flooplan[index]!.paths[0]!));

      floorplanUrl[index] = await referenceImageToUpload.getDownloadURL();
      print('imageurl $floorplanUrl');
    } catch (e) {
      // log(e.toString());F
    }
    print('done');
    refresh();
  }
  // seereviewDetails(index) {

  //   refresh();
  // }
}
