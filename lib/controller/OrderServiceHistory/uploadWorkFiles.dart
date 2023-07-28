import 'dart:ffi';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadWorkFilesController extends GetxController {

  List<XFile?> imgXfileList = List.empty(growable: true);
  List<String?> imgurlList = List.empty(growable: true);

  uploadImagefile() async {
    addIm();
    int buttonIndex = imgurlList.length - 1;

    final uploadimgkey = DateTime.now().microsecondsSinceEpoch;
    imgXfileList[buttonIndex] =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages =
        referenceRoot.child('adminuploadDesign/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uploadimgkey.toString());

    // Uint8List uploadfile = result.files.single.bytes;

    print('uploadimg file called');
    if (imgXfileList[buttonIndex] == null) {
      return;
    }
    try {
      await referenceImageToUpload
          .putFile(File(imgXfileList[buttonIndex]!.path));
      imgurlList[buttonIndex] = await referenceImageToUpload.getDownloadURL();
      print('imageurl ${imgurlList[buttonIndex]}');
    } catch (e) {
      // log(e.toString());F
    }
    refresh();
  }

  addIm() {
    imgurlList.add(null);
    imgXfileList.add(null);
    refresh();
  }

  removeIm(index) {
    imgurlList.removeAt(index);
    imgXfileList.removeAt(index);
    refresh();
  }

  cleatIm() {
    imgurlList.clear();
    imgXfileList.clear();
    refresh();
  }
}
