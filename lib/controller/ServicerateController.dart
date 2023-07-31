import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicerateController extends GetxController {
  final List<String> designType = ['Modern', 'Classical'];
  //  List<String> designTypeSecond = [];

  int serviceTypeCount = 1;
  List<bool> serviceSelectedBoolList = List.filled(11, false);

  List<bool> modernSelectedBoolList = List.filled(11, false);
  List<bool> classicalSelectedBoolList = List.filled(11, false);

  List HousetypeServicerateList = [];

  List serviceRateDataListEditing = [];

  // List<List<TextEditingController>> servicerateTextController = List.generate(
  //   10,
  //   (_) => [
  //     TextEditingController(),
  //   ],
  // );

  List<TextEditingController> modernControllerList = List.generate(
    11,
    (index) => TextEditingController(),
  );

  //   List<TextEditingController> moderntextControllerList = List.generate(
  //   11,
  //   (index) => TextEditingController(),
  // );

  List<TextEditingController> classicalControllerList = List.generate(
    11,
    (index) => TextEditingController(),
  );

  
  List<TextEditingController> minratemodernControllerList = List.generate(
    11,
    (index) => TextEditingController(),
  );

  List<TextEditingController> minrateclassicalControllerList = List.generate(
    11,
    (index) => TextEditingController(),
  );

  changeserviceTypeCountfunction(index) {
    selctedserviceRateMainList[index].add('Modern');
    // print('${serviceRateMainlist} kkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    refresh();
  }

  changeserviceRateDataListEditing(primaryindex) {
    serviceRateDataListEditing[primaryindex]['isSelected'] =
        !serviceRateDataListEditing[primaryindex]['isSelected'];
    refresh();
  }

  changeModernserviceRateDataListEditing(primaryindex) {
    serviceRateDataListEditing[primaryindex]['modern']['isSelected'] =
        !serviceRateDataListEditing[primaryindex]['modern']['isSelected'];
    refresh();
  }

  changeclassicalserviceRateDataListEditing(primaryindex) {
    serviceRateDataListEditing[primaryindex]['classic']['isSelected'] =
        !serviceRateDataListEditing[primaryindex]['classic']['isSelected'];
    refresh();
  }

  changeModernSelectedBoolList(primaryindex) {
    modernSelectedBoolList[primaryindex] =
        !modernSelectedBoolList[primaryindex];

    refresh();
    // print(subServiceSelectedBoolList[primaryindex][index]);
  }

  changeClassicalSelectedBoolList(primaryindex) {
    classicalSelectedBoolList[primaryindex] =
        !classicalSelectedBoolList[primaryindex];

    refresh();
    // print(subServiceSelectedBoolList[primaryindex][index]);
  }

  removeserviceTypeCountfunction(index) {
    selctedserviceRateMainList[index].removeLast();
    refresh();
  }

  changeServiceSelectedbool(index) {
    serviceSelectedBoolList[index] = !serviceSelectedBoolList[index];
    refresh();
  }

//
//
  //copied from old
//

//

  int numberOfFloors = 1;
//new values

  List selectedFloorList = ['Basement'];
  List roomtypeitemsvalue = ['Rooms'];
  List roomcountvalue = ['1'];

  Map groupofselectedfloolist = {};

  List createdlistofitems = [];

  int roomCount = 1;

  //end

  var dropdownditems = [
    'Basement',
    'Ground Floor',
    'First Floor',
    'Second Floor',
    'Third Floor',
  ];

  var roomtypeitems = [
    'Rooms',
    'Toilets',
    'Balcony',
    'Garden',
  ];

  var roomcount = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  //new function

  changeroomcountfunction(int count) {
    roomCount = roomCount + count;
    refresh();
  }

  //end Here

  // decrementfloorcount(int floorCount) {
  //   incrementedfloorCount = incrementedfloorCount - floorCount;
  //   refresh();
  // }

  // changedropdowbvalue(value) {
  //   dropdownvalue = value;
  //   refresh();
  // }

  roomtypevalue(value) {
    roomtypeitemsvalue = value;
    refresh();
  }

  changeroomcount(value) {
    roomcountvalue = value;
    refresh();
  }
}
