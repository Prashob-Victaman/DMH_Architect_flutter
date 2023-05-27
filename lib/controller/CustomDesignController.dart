import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/PurchasedDesignsModel.dart';

class CustomDesignController extends GetxController {
  int selectedDesignTypeindex = 0;
  int selectedHouseType = 0;

  changeoption(index) {
    selectedDesignTypeindex = index;

    refresh();
  }

  changeHouseType(index) {
    selectedHouseType = index;

    refresh();
  }

  uploadCustomDesignData(
    String uploadedUserUid,
    String projectDetails,
    String designType,
    String houseFloors,
    String houseType,
    Map houseArea,
    String accordingtoVastu,
    String userMobileNumber,
    String userName,
    String designPrice,
    String designerName,
  ) async {
    final docUrl =
        FirebaseFirestore.instance.collection('PurchasedDesign').doc();
    // print('object');
    final designData = PurchasedDesignsModel(
        sortId: DateTime.now().millisecondsSinceEpoch,
        plotArea: houseArea,
        designType: designType,
        userName: userName,
        userMobileNumber: userMobileNumber,
        houseType: houseType,
        houseFloors: houseFloors,
        projectDetails: projectDetails,
        accordingtoVastu: accordingtoVastu,
        designPrice: designPrice,
        designerName: designerName,
        isPaymentDone: false,
        uid: docUrl.id);

    final json = designData.toJson();

    await docUrl.set(json);
    refresh();
  }
}
