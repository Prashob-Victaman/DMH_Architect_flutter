import 'package:get/get.dart';

class drawercontroller extends GetxController {

int selectedoption = 0;

  changeoption(count) {
    selectedoption = count;
    refresh();
  }
}