import 'dart:ffi';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadWorkFilesController extends GetxController {

  List<List<XFile?>> imgXfileList = List.empty(growable: true);
  List<List<String?>> imgurlList = List.empty(growable: true);

  uploadImagefile(serviceIndex) async {
    addIm(serviceIndex);
    int buttonIndex = imgurlList.length - 1;

    final uploadimgkey = DateTime.now().microsecondsSinceEpoch;
    imgXfileList[serviceIndex][buttonIndex] =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages =
        referenceRoot.child('adminuploadDesign/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uploadimgkey.toString());

    // Uint8List uploadfile = result.files.single.bytes;

    print('uploadimg file called');
    if (imgXfileList[serviceIndex][buttonIndex] == null) {
      return;
    }
    try {
      await referenceImageToUpload
          .putFile(File(imgXfileList[serviceIndex][buttonIndex]!.path));
      imgurlList[serviceIndex][buttonIndex] = await referenceImageToUpload.getDownloadURL();
      print('imageurl $imgurlList[buttonIndex]');
    } catch (e) {
      // log(e.toString());F
    }
    refresh();
  }

  addIm(serviceIndex) {
    imgurlList.add([]);
    imgurlList[serviceIndex].add(null);
    imgXfileList[serviceIndex].add(null);
    refresh();
  }

  removeIm(serviceIndex,index) {
    imgurlList[serviceIndex].removeAt(index);
    imgXfileList[serviceIndex].removeAt(index);
    refresh();
  }

  cleatIm() {
    imgurlList.clear();
    imgXfileList.clear();
    refresh();
  }
}
