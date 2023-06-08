

import 'package:get/get.dart';

class GetDesignController extends GetxController{

  late List selectedFile;


  void initilizeList(int n){
    selectedFile =  List<bool?>.filled(n+1, false);
  }

  changeValue(int n){
    selectedFile[n] = !selectedFile[n];
    refresh();
  }

}