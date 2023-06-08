import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AreaController extends GetxController {
  var length;
  var height;
  var area = '';
  String calculatearea() {
    if (length != null &&
        height != null &&
        double.tryParse(length) != null &&
        double.tryParse(height) != null) {
      area = (double.parse(length) * double.parse(height)).toStringAsFixed(2);
      // print(area);
    }
    refresh();
    return area;
  }
}
