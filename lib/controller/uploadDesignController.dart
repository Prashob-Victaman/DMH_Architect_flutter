// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import '../model/notificationModel.dart';
// import '../model/uploadDesignDataModel.dart';

// class uploadDesignTypeController extends GetxController {
//   int selectedDesignTypeindex = 0;
//   int selectedHouseType = 0;

//   static int imgCount = 14;

//   List<String?> ExteriorImageUrl = List<String?>.filled(3, null);
//   List<String?> FloorImageUrl = List<String?>.filled(3, null);
//   List<String?> planingImageUrl = List<String?>.filled(6, null);
//   List<XFile?> exteriorImgs = List<XFile?>.filled(3, null);
//   List<XFile?> floorImgs = List<XFile?>.filled(3, null);
//   List<XFile?> planningImgs = List<XFile?>.filled(6, null);
//   List<XFile?> structureImgs = List<XFile?>.filled(3, null);
//   List<XFile?> elevationImgs = List<XFile?>.filled(3, null);

//   List<String?> exteriorimgurlList = List<String?>.filled(9, null);

//   List<Uint8List?> exteriorimgunit8List = List<Uint8List?>.filled(9, null);


//   // String ExteriorImageUrl = '';

//   final exteriorDesignNameControllerList = List.generate(3, (_) => TextEditingController());

//   final floorDesignNameControllerList = List.generate(3, (_) => TextEditingController());


//   changeoption(index) {
//     selectedDesignTypeindex = index;
//     refresh();
//   }

//   changeHouseType(index) {
//     selectedHouseType = index;

//     refresh();
//   }

// <<<<<<< HEAD
// =======
//   changetextControllercount(int value) {
//     if (value == 1) {
//       exteriorDesignNameControllerList.add(TextEditingController());
//       // exteriorimgcount + 1;
//     } else {
//       exteriorDesignNameControllerList.removeLast();
//       // exteriorimgcount - 1;
//     }
//     refresh();
//   }


//   uploadexteriorimagefileOne(buttonIndex) async {
//     final uploadimgkey = DateTime.now().microsecondsSinceEpoch;

//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     Reference referenceRoot = FirebaseStorage.instance.ref();
//     Reference referenceDirectoryImages =
//     referenceRoot.child('adminuploadDesign/');
//     Reference referenceImageToUpload =
//     referenceDirectoryImages.child(uploadimgkey.toString());

//     // Uint8List uploadfile = result.files.single.bytes;

//     print('uploadimg file called');
//     if (result != null) {
//       exteriorimgunit8List[buttonIndex] = result.files.single.bytes;

//       try {
//         await referenceImageToUpload
//             .putData(exteriorimgunit8List[buttonIndex]!);

//         exteriorimgurlList[buttonIndex] =
//         await referenceImageToUpload.getDownloadURL();
//         print('imageurl $exteriorimgurlList[buttonIndex]');
//       } catch (e) {
//         // log(e.toString());F
//       }
//     } else {
//       // User canceled the picker
//     }
//     refresh();
//   }

// >>>>>>> d8ca925f1b27ba4ec958d4ee007878dd874e92b6
//   fetchExteriorImg(buttonIndex, context) async {
//     // showDialog(
//     //     barrierDismissible: true,
//     //     context: context,
//     //     builder: (context) {
//     //       return Center(child: const CircularProgressIndicator());
//     //     });
//     final uniqueProductImageName = DateTime.now().microsecondsSinceEpoch;
//     exteriorImgs[buttonIndex] =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     Reference referenceRoot = FirebaseStorage.instance.ref();
//     Reference referenceDirectoryImages = referenceRoot.child(
//         'Architect/Designs/${FirebaseAuth.instance.currentUser!.uid}/Exterior_photos/');
//     Reference referenceImageToUpload =
//         referenceDirectoryImages.child(uniqueProductImageName.toString());
//     // log(uniqueProductImageName.toString());
//     if (exteriorImgs[buttonIndex] == null) {
//       return;
//     }
//     try {
//       await referenceImageToUpload
//           .putFile(File(exteriorImgs[buttonIndex]!.path));

//       ExteriorImageUrl[buttonIndex] =
//           await referenceImageToUpload.getDownloadURL();
//       // log(useridProofimg);
//     } catch (e) {
//       // log(e.toString());
//       if (kDebugMode) {}
//     }
//     refresh();
//   }

//   fetchFloorImg(buttonIndex) async {
//     final uniqueProductImageName = DateTime.now().microsecondsSinceEpoch;
//     floorImgs[buttonIndex] = await ImagePicker().pickImage(source: ImageSource.gallery);
//     Reference referenceRoot = FirebaseStorage.instance.ref();
//     Reference referenceDirectoryImages = referenceRoot.child(
//         'Architect/Designs/${FirebaseAuth.instance.currentUser!.uid}/floor_photos/');
//     Reference referenceImageToUpload = referenceDirectoryImages.child(uniqueProductImageName.toString());



//     if (floorImgs[buttonIndex] == null) {
//       return;
//     }
//     try {
//       await referenceImageToUpload.putFile(File(floorImgs[buttonIndex]!.path));
//       FloorImageUrl[buttonIndex] =
//           await referenceImageToUpload.getDownloadURL();
//       // log(useridProofimg);
//     } catch (e) {
//       // log(e.toString());
//       if (kDebugMode) {}
//     }
//     refresh();
//   }

//   fetchPlanningImg(buttonIndex) async {
//     final uniqueProductImageName = DateTime.now().microsecondsSinceEpoch;
//     planningImgs[buttonIndex] =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     Reference referenceRoot = FirebaseStorage.instance.ref();
//     Reference referenceDirectoryImages = referenceRoot.child(
//         'Architect/Designs/${FirebaseAuth.instance.currentUser!.uid}/Exterior_photos/');
//     Reference referenceImageToUpload =
//         referenceDirectoryImages.child(uniqueProductImageName.toString());
//     // log(uniqueProductImageName.toString());
//     if (planningImgs[buttonIndex] == null) {
//       return;
//     }
//     try {
//       await referenceImageToUpload
//           .putFile(File(planningImgs[buttonIndex]!.path));
//       planingImageUrl[buttonIndex] =
//           await referenceImageToUpload.getDownloadURL();
//       // log(useridProofimg);
//     } catch (e) {
//       // log(e.toString());
//       if (kDebugMode) {}
//     }
//     refresh();
//   }

//   uploadDesignData(
//     String uploadedUserUid,
//     String projectDetails,
//     String imageOneurl,
//     String imageTwourl,
//     String imageThreeurl,
//     String designType,
//     String houseFacing,
//     String houseFloors,
//     String houseType,
//     Map houseArea,
//     String accordingtoVastu,
//     String estimatedConstructionCost,
//     String aproximateConstructionCost,
//     String floorfileimageOneurl,
//     String floorfileimageTwourl,
//     String floorfileimageThreeurl,
//     String designprice,
//     String shortdescription,
//     String architectName,
// <<<<<<< HEAD
//     List planingFileUrlList,
//     List planingFileNameList,
//     List planingFilePriceList,
// =======
//       List planingFileUrlList,
//       List planingFileNameList,
//       List planingFilePriceList,
//       List floordetails,
// >>>>>>> d8ca925f1b27ba4ec958d4ee007878dd874e92b6
//   ) async {
//     final docUrl =
//         FirebaseFirestore.instance.collection('DesignDataFromAdmin').doc();

//     final designData = designDataModel(
//         designprice: designprice,
//         shortdescription: shortdescription,
//         floorfileimageOneurl: floorfileimageOneurl,
//         floorfileimageThreeurl: floorfileimageThreeurl,
//         floorfileimageTwourl: floorfileimageTwourl,
//         uid: docUrl.id,
//         sortId: DateTime.now().millisecondsSinceEpoch,
//         uploadedUserUid: uploadedUserUid,
//         projectDetails: projectDetails,
//         imageOneurl: imageOneurl,
//         imageTwourl: imageTwourl,
//         imageThreeurl: imageThreeurl,
//         designType: designType,
//         houseFacing: houseFacing,
//         houseFloors: houseFloors,
//         houseType: houseType,
//         houseArea: houseArea,
//         accordingtoVastu: accordingtoVastu,
//         estimatedConstructionCost: estimatedConstructionCost,
//         aproximateConstructionCost: aproximateConstructionCost,
//         postedDate: DateTime.now(),
//         visitors: 0,
//         uploadedBy: architectName,
//         planingFileUrlList: planingFileUrlList,
//         planingFileNameList: planingFileNameList,
//         planingFilePriceList: planingFilePriceList);

//     final json = designData.toJson();

//     await docUrl.set(json);

//     final docNotifcaton =
//         FirebaseFirestore.instance.collection('Notifications').doc();

//     final notificationData = notificationModel(
//         time: DateTime.now(),
//         imgUrl: floorfileimageOneurl,
//         title: '${architectName} Added New Design',
//         sortid: DateTime.now().millisecondsSinceEpoch,
//         uid: docUrl.id);
//     await docNotifcaton.set(notificationData.toJson());

//     await FirebaseFirestore.instance
//         .collection("ArchitectData")
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .update({
//       'myDesigns': FieldValue.arrayUnion([designData.toJson()])
//     });
//     refresh();
//   }
// }



// class UploadDesignController extends GetxController {
//   // String dropdownvalue = 'Basement';

//   int numberOfFloors = 1;
// //new values

//   List selectedFloorList = ['Basement'];
//   List roomtypeitemsvalue = ['Rooms'];
//   List roomcountvalue = ['1'];

//   Map groupofselectedfloolist = {};

//   List createdlistofitems = [];

//   int roomCount = 1;

//   //end

//   var dropdownditems = [
//     'Basement',
//     'Ground Floor',
//     'First Floor',
//     'Second Floor',
//     'Third Floor',
//   ];

//   var roomtypeitems = [
//     'Rooms',
//     'Toilets',
//     'Balcony',
//     'Garden',
//   ];

//   var roomcount = [
//     '1',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//   ];

//   //new function

//   changeroomcountfunction(int count) {
//     roomCount = roomCount + count;
//     refresh();
//   }

//   //end Here
//   int incrementedfloorCount = 1;
//   incrementfloorcount(int floorCount) {
//     numberOfFloors = numberOfFloors + floorCount;
//     refresh();
//   }

//   // decrementfloorcount(int floorCount) {
//   //   incrementedfloorCount = incrementedfloorCount - floorCount;
//   //   refresh();
//   // }

//   // changedropdowbvalue(value) {
//   //   dropdownvalue = value;
//   //   refresh();
//   // }

//   roomtypevalue(value) {
//     roomtypeitemsvalue = value;
//     refresh();
//   }

//   changeroomcount(value) {
//     roomcountvalue = value;
//     refresh();
//   }
// }
