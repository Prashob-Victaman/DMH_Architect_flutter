import 'package:get/get.dart';

class OrderController extends GetxController {
  // List workingdetailsbool = [false, false, false, false, false, false];

  List<bool> workingdetailsbool = List<bool>.filled(6, false);
  List<bool> seereviewsbool = List<bool>.filled(6, false);

  seeWorkingDetails(index) {
    if (workingdetailsbool[index] == false) {
      workingdetailsbool[index] = true;
    } else {
      workingdetailsbool[index] = false;
    }
    if (seereviewsbool[index] == false) {
      seereviewsbool[index] = true;
    } else {
      seereviewsbool[index] = false;
    }

    // seereviewDetails(index);
    refresh();
  }

  chooseArchitect() {}
  // seereviewDetails(index) {

  //   refresh();
  // }
}
