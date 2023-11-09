import 'package:get/get.dart';

class myDesignController extends GetxController {
  var designTypeList = ['Modern', 'Classical'];

  var housedesignname = [
    'Simplex',
    'Duplex',
    'Triplex',
    'Bungalow',
    'Apartment',
    'Shoping Mall',
    'School',
    'College',
    'Hospital',
    'Hotel',
    'Restaurant',
    'Banquet Hall',
    'Lodge',
    'Hostel',
  ];

  String selectedDesignType = 'Simplex';

  changeDropdownValue(value) {
    selectedDesignType = value;
    refresh();
  }
}
