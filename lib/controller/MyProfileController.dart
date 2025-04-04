import 'package:get/get.dart';

class MyProfileController extends GetxController {
  bool showPersonalDetails = true;
  bool showProfessionalQualification = true;
  bool showOfficeDetails = true;
  bool showBankDetails = true;

  void changeshowPersonalDetails(bool value) {
    showPersonalDetails = value;

    refresh();
  }

  void changeshowProfessionalQualification(bool value) {
    showProfessionalQualification = value;

    refresh();
  }

  void changesshowOfficeDetails(bool value) {
    showOfficeDetails = value;

    refresh();
  }

  void changesshowBankDetails(bool value) {
    showBankDetails = value;

    refresh();
  }
}
