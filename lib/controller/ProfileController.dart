import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  UpdateUserData(uid, String firstName, String lastName, mobileNumber,
      String gender, String dateOfBirth) async {
    await FirebaseFirestore.instance.collection("UserData").doc(uid).update({
      'ProfileDetails': {
        'firstName': firstName,
        'lastName': lastName,
        'mobileNumber': mobileNumber,
        'gender': gender,
        'dateOfBirth': dateOfBirth,
        'id': DateTime.now().millisecondsSinceEpoch,
      }
    });
  }

  UpdatearchitectData(uid, String firstName, mobileNumber, String designation,
      String gender) async {
    await FirebaseFirestore.instance
        .collection("ArchitectData")
        .doc(uid)
        .update({
      'name': firstName,
      'mobilenumber': mobileNumber,
      'designation': designation,
      'gender': gender
    });
  }
}
