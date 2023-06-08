import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ArchitectUploadDesignTypeController extends GetxController {
  int selectedDesignTypeindex = 0;
  int selectedHouseType = 0;

  static int imgCount = 14;



  // String ExteriorImageUrl = '';

  changeoption(index) {
    selectedDesignTypeindex = index;
    refresh();
  }

  changeHouseType(index) {
    selectedHouseType = index;

    refresh();
  }


// fetchPlanningImg(buttonIndex) async {
//   final uniqueProductImageName = DateTime.now().microsecondsSinceEpoch;
//   planningImgs[buttonIndex] =
//       await ImagePicker().pickImage(source: ImageSource.gallery);
//   Reference referenceRoot = FirebaseStorage.instance.ref();
//   Reference referenceDirectoryImages = referenceRoot.child(
//       'Architect/Designs/${FirebaseAuth.instance.currentUser!.uid}/Exterior_photos/');
//   Reference referenceImageToUpload =
//       referenceDirectoryImages.child(uniqueProductImageName.toString());
//   // log(uniqueProductImageName.toString());
//   if (planningImgs[buttonIndex] == null) {
//     return;
//   }
//   try {
//     await referenceImageToUpload
//         .putFile(File(planningImgs[buttonIndex]!.path));
//     planingImageUrl[buttonIndex] =
//         await referenceImageToUpload.getDownloadURL();
//     // log(useridProofimg);
//   } catch (e) {
//     // log(e.toString());
//     if (kDebugMode) {}
//   }
//   refresh();
// }
}
