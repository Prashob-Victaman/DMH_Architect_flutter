import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicerateController extends GetxController {
  final List<String> desiignType = ['Simple', "Modern", 'Classical', 'Others'];

  int serviceTypeCount = 1;

  List HousetypeServicerateList = [];

    List<List<TextEditingController>> servicerateTextController = List.generate(
    10,
    (_) => [TextEditingController()],
  );

  changeserviceTypeCountfunction(index) {
    selctedserviceRateMainList[index].add('Simple');
    // print('${serviceRateMainlist} kkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    refresh();
  }

  removeserviceTypeCountfunction(index) {
    selctedserviceRateMainList[index].removeLast();
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
