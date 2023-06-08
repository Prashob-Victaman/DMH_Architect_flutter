import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ArchitectUploadDesignTypeController extends GetxController {
  int selectedDesignTypeindex = 0;
  int selectedHouseType = 0;

  static int imgCount = 14;

  List<String?> planingImageUrl = List<String?>.filled(6, null);

  List<FilePickerResult?> planningImgs = List<FilePickerResult?>.filled(6, null);

  // String ExteriorImageUrl = '';

  changeoption(index) {
    selectedDesignTypeindex = index;
    refresh();
  }

  changeHouseType(index) {
    selectedHouseType = index;

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
      return;
    }
   // planningImgs[buttonIndex] = planningImgs[buttonIndex].files.single.bytes;

    try {
      await referenceImageToUpload.putFile(File(planningImgs[buttonIndex]!.paths[0]!));

      planingImageUrl[buttonIndex] =
          await referenceImageToUpload.getDownloadURL();
      print('imageurl $planingImageUrl');
    } catch (e) {
      // log(e.toString());F
    }
    print('done');
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
