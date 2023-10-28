import 'package:get/get_state_manager/get_state_manager.dart';

class ArchitectUploadDesignController extends GetxController {
  // String dropdownvalue = 'Basement';

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
    'Fourth Floor',
    'Fifth Floor',
    'Sixth Floor',
    'Seventh Floor',
    'Eighth Floor',
    'Ninth Floor',
    'Tenth Floor',
  ];

  var roomtypeitems = [
    // 'Rooms',
    // 'Toilets',
    // 'Balcony',
    // 'Garden',
    'Bed Room',
    'Master Room',
    'Rooms',
    'Hall',
    'Dinning Hall',
    'Drawing Hall',
    'Living Hall',
    'Kitchen',
    'Toilet',
    'Toilet + Dressing',
    'Bathroom',
    'Washroom',
    'Pooja Room',
    'Store Room',
    'Verandah',
    'Stairs',
    'Lift',
    'Garage',
    'Balcony',
    'Terrace',
    'Lawn',
    'Swimming Pool',
    'Parking',
    'Garden',
    'Shop',
    'Godown',
    'Conference Hall',
    'Meeting Hall',
    'Wardrobe'
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
  int incrementedfloorCount = 1;
  incrementfloorcount(int floorCount) {
    numberOfFloors = numberOfFloors + floorCount;
    refresh();
  }

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
