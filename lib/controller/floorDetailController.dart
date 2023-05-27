import 'package:get/get.dart';

class FloorDetailController extends GetxController{

  int numberOfFloors = 1;
  List numberOfRoomType = [0];
  List selectedFloorList = ['Basement'];
  List selectedTypeList = ['Rooms'];
  List numberOfRoomsList = [1];

  updateNumberOfRoomType(int index,int value){
    numberOfRoomType[index] += value;
    refresh();
  }
}

