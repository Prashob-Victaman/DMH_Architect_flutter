import 'package:dmh_architect/Constants/constants.dart';
import 'package:get/get.dart';

class ServicerateController extends GetxController {
  // String selectedState = 'Karnataka';
  // String serviceType = 'Planning';
  // List<String> serviceTypeList = ['Planning'];

  final List<String> desiignType = ['Simple', "Modern", 'Classical', 'Others'];

  // List<Map> serviceRateMainlist = [
  //   {serviceType[0]: []},
  //   {serviceType[1]: []},
  //   {serviceType[2]: []},
  //   {serviceType[3]: []},
  //   {serviceType[4]: []},
  //   {serviceType[5]: []},
  //   {serviceType[6]: []},
  //   {serviceType[7]: []}
  // ];

  // List<Map<String, List<dynamic>>> serviceRateMainlist = List.generate(
  //     10,
  //     (listindex) => {
  //           serviceType[listindex]: [
  //             {selctedserviceRateMainList: 'value'}
  //           ]
  //         });

  int serviceTypeCount = 1;

  List HousetypeServicerateList = [];

  // Map? serviceTypeMap = {};

  // int count = 1;

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
