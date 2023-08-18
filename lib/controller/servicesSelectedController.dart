import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceSelectedController extends GetxController {
  double sitesupervisionamount = 0;
  double nakshshaamount = 0;

  // ScrollController scrollController = ScrollController();

  changesitesupervisionamount() {
    sitesupervisionamount = sitesupervisionamount;
    // nakshshaamount = nakshshaamount;

    refresh();
  }

  changenakshshaamount() {
    nakshshaamount = nakshshaamount;

    refresh();
  }
}
