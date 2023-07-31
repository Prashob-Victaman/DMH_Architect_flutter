import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomePageContoller extends GetxController {
  var Username;
  getseparatedData() async {
    CollectionReference<Map<String, dynamic>> collectionRef =
        FirebaseFirestore.instance.collection('DesignDataFromAdmin');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionRef.where('uploadedUserUid',isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

    Map<String, List<Map<String, dynamic>>> separatedData = {};

    for (QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot
        in querySnapshot.docs) {
      Map<String, dynamic> documentData = docSnapshot.data();
      String category = documentData['houseType'];

      if (separatedData.containsKey(category)) {
        separatedData[category]!.add(documentData);
      } else {
        separatedData[category] = [documentData];
      }
    }

    // log(separatedData['Bungalow'].toString());

    return separatedData;
  }

  getdata() async {
    final data = await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    //  final data = data.fromJson(snapshot.data!);
    // print(widget.stream);

    // final data = snapshot.data;

    Username = await data['ProfileDetails']['firstName'];
    refresh();
    print(Username);
  }
}
