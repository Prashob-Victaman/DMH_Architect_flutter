import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kprimarycolor = Color.fromARGB(255, 255, 90, 95);
const kprimarycolor50 = Color.fromARGB(255, 255, 202, 204);

const kwhitecolor = Colors.white;
const ksuccesscolor = Color.fromARGB(255, 32, 174, 0);

const kblackcolor = Colors.black;
const kyellowcolor = Color.fromARGB(255, 249, 179, 70);
const kgreycolor = Color.fromARGB(255, 158, 158, 158);
const kashcolor = Color.fromARGB(255, 240, 239, 239);
const kpinkcolor = Color.fromARGB(255, 247, 205, 205);
const kredcolor = Color.fromARGB(255, 255, 43, 43);
const kbluecolor = Color.fromARGB(255, 14, 12, 198);

final heigh10 = SizedBox(height: 10.w);
final heigh20 = SizedBox(height: 20.w);
final heigh5 = SizedBox(height: 5.w);

final width20 = SizedBox(width: 20.w);
final width10 = SizedBox(width: 10.w);

final width5 = SizedBox(width: 5.w);

final bold25 = TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold);
final bold22 = TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold);
final bold20 = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold);
final bold21 = TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold);
final bold19 = TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold);

final bold16 = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold);
final bold17 = TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold);
final bold18 = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold);

final normal22 = TextStyle(
  fontSize: 20.sp,
);
final normal20 = TextStyle(
  fontSize: 18.sp,
);
final normal18 = TextStyle(
  fontSize: 16.sp,
);
final normal12 = TextStyle(
  fontSize: 10.sp,
);
final bold13 = TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold);
final bold15 = TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold);

final bold12 = TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold);

final normal11 = TextStyle(
  fontSize: 11.sp,
);
final normal10 = TextStyle(
  fontSize: 8.sp,
);
final normal16 = TextStyle(fontSize: 14.sp);
final normal14 = TextStyle(
  fontSize: 12.sp,
);
final normal15 = TextStyle(
  fontSize: 13.sp,
);

final housedesignname = [
  'Simplex',
  'Duplex',
  'Triplex',
  'Bunglow',
  'Lodge/hotel',
  'Apartment',
  'Shoping Mall',
  'School/College',
  'Hospital',
  'Hotel',
  'Restaurent',
  'Banquet Hall',
];

final houserenewname = [
  'Floor Planing',
  '3D Floor Plans',
  '3D Interior  Design',
  'Exterior Design',
  '3D Exterior Design',
  'Walk Through Video (Exterior)',
  'Walk Through Video (Interior)',
  'Walk Through Video (Interior/Exterior)',
  'View All',
];

final reasons = [
  '50+ Designss',
  '1+ Language',
  'Quick Order',
  'Order Status',
  'Instant Refund',
  '24/7 Support',
  'Quick Saved Details',
  'Lifetime Income',
];

final housedesignimages = [
  'asset/houseimage/simplex.png',
  'asset/houseimage/Duplex.png',
  'asset/houseimage/triplex.png',
  'asset/houseimage/bunglow.png',
  'asset/houseimage/lodge.png',
  'asset/houseimage/apartment.png',
  'asset/houseimage/shopingmall.png',
  'asset/houseimage/school.png',
  'asset/houseimage/hospital.png',
  'asset/houseimage/hotel.png',
  'asset/houseimage/restarant.png',
  'asset/houseimage/Banguet_Hall.png',
];

final houserenewimages = [
  'asset/houserenew/floor_planning.png',
  'asset/houserenew/3d_floor_plans.png',
  'asset/houserenew/3d_interior_design.png',
  'asset/houserenew/exterior_design.png',
  'asset/houserenew/3d_exteriro_design.png',
  'asset/houserenew/walk_throgh_video_exterior.png',
  'asset/houserenew/walk_throgh_video_interior.png',
  'asset/houserenew/walk_throgh_video_interior_exterior.png',
  'asset/houserenew/arrow.png',
];

final reasonsimage = [
  'asset/reasonsimage/designs.png',
  'asset/reasonsimage/language.png',
  'asset/reasonsimage/order.png',
  'asset/reasonsimage/orderstatus.png',
  'asset/reasonsimage/refund.png',
  'asset/reasonsimage/support.png',
  'asset/reasonsimage/details.png',
  'asset/reasonsimage/income.png',
];

deatilscustomInputDecoration(String hint) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(
      left: 10.w,
    ),
    fillColor: kredcolor,
    hintText: hint,
    hintStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.grey.shade600,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.w),
      borderSide: const BorderSide(color: Colors.black12),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.w),
      borderSide: const BorderSide(color: Colors.black12),
    ),
  );
}

customInputDecoration(String hint) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: 10.w, right: 5.w),
    fillColor: kredcolor,
    hintText: hint,
    hintStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.grey.shade600,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.w),
      borderSide: const BorderSide(color: Colors.black12),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.w),
      borderSide: const BorderSide(color: Colors.black12),
    ),
  );
}

customBoxDecoration() {
  return BoxDecoration(
    color: kashcolor.withOpacity(0.5),
    borderRadius: BorderRadius.circular(5.0.w),
    border: Border.all(
        color: Colors.black12, style: BorderStyle.solid, width: 0.80.w),
  );
}

customBoxDecoration_two() {
  return ShapeDecoration(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black12),
      borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
    ),
  );
}

final List<String> stateDropdown = [
  'Andhra Pradesh',
  'Arunachal Pradesh	',
  'Assam',
  'Bihar',
  'Chhattisgarh',
  'Goa',
  'Gujarat',
  'Haryana',
  'Himachal Pradesh	',
  'Jharkhand',
  'Karnataka',
  'Kerala',
  'Madhya Pradesh	',
  'Maharashtra	',
  'Manipur',
  'Meghalaya',
  'Mizoram',
  'Nagaland',
  'Odisha',
  'Punjab',
  'Rajasthan',
  'Sikkim',
  'Tamil Nadu	',
  'Telangana	',
  'Tripura',
  'Uttar Pradesh	',
  'Uttarakhand',
  'West Bengal',
];

final List<String> Iditems = [
  'Passport',
  'Driving License',
  'PAN Card',
  'Adhaar Card',
];

final List<String> Idworkitems = [
  'Pancard',
  'GST Certificate',
  'MSME Certificate',
];

Country selectedCountryph = Country(
  phoneCode: "91",
  countryCode: "IN",
  e164Sc: 0,
  geographic: true,
  level: 1,
  name: "India",
  example: "India",
  displayName: "India",
  displayNameNoCountryCode: "IN",
  e164Key: "",
);

Country selectedCountrywh = Country(
  phoneCode: "91",
  countryCode: "IN",
  e164Sc: 0,
  geographic: true,
  level: 1,
  name: "India",
  example: "India",
  displayName: "India",
  displayNameNoCountryCode: "IN",
  e164Key: "",
);

List HouseType = [
  'Simplex',
  'Duplex',
  'Triplex',
  'Apartment',
  'Bungalow',
  'LodgeHotel',
  'Apartment',
  'ShopingMall',
  'SchoolCollege',
  'Hospital',
  'Hotel',
  'Restarent',
  'BanquetHall'
];

// final List<String> serviceType = [
//   "Planning",
//   'Structure',
//   '2D Elevation',
//   '3D Elevation',
//   '3D Floor',
//   'Walkthrough Video(Exterior)',
//   'Walkthrough Video(Interior & Exterior)',
//   'Electricals',
//   'Plumbing',
//   'Site Supervision',
// ];

// List desiignTypeselectedvaluelist = ['Simple'];

// List<List> selctedserviceRateMainList =
//     List<List>.filled(10,  ['Simple']);

// List<List> selctedserviceRateMainList = [
//   ['Simple'],
//   ['Simple'],
//   ['Simple'],
//   ['Simple'],
//   ['Simple'],
//   ['Simple'],
//   ['Simple'],
//   ['Simple'],
//   ['Simple'],
//   ['Simple'],
// ];

List<List<String>> selctedserviceRateMainList =
    List.generate(10, (_) => ['Modern']);

Map selctedserviceRateMainListmap = {
  "Floor Plan": selctedserviceRateMainList[0],
  'Structural Drawing': selctedserviceRateMainList[1],
  '3D Front Elevation': selctedserviceRateMainList[2],
  '2D Front Elevation': selctedserviceRateMainList[3],
  '3D Floor Plan': selctedserviceRateMainList[4],
  'Working Drawing': selctedserviceRateMainList[5],
  'Electrical Plan': selctedserviceRateMainList[6],
  'Plumbing Plan': selctedserviceRateMainList[7],
  'Walkthough Video': selctedserviceRateMainList[8],
  'Site Supervision': selctedserviceRateMainList[9],
};

final List<String> serviceListItems = [
  'Floor Plan',
  'Structural Drawing',
  '3D Front Elevation',
  '2D Front Elevation',
  '3D Floor Plan',
  'Working Drawing',
  'Electrical Plan',
  'Plumbing Plan',
  'Walkthough Video',
  'Site Supervision'
];
