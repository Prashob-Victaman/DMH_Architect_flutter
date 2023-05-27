import 'package:get/get.dart';

class CheckboxController extends GetxController {
  int selectedHouseFloor = 0;
  int selectedHouseFacing = 0;

  changeHouseFloor(index) {
    int selectedHouseFloor = index;
    // print(selectedHouseFloor);
    refresh();
  }

  changeHouseFacing(index) {
    int selectedHouseFacing = index;
    // print(index);
    refresh();
  }
}
