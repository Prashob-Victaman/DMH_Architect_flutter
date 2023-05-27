// import 'package:cloud_firestore/cloud_firestore.dart';

// class recieveDesignDataFromAdmin {
//   String uploadedUserUid;
//   String uid;
//   String imageOneurl;
//   String imageTwourl;
//   String imageThreeurl;
//   int sortId;
//   String projectDetails;
//   String designType;
//   String houseFacing;
//   String houseFloors;
//   String houseType;
//   Map houseArea;
//   String accordingtoVastu;
//   String estimatedConstructionCost;
//   Timestamp postedDate;
//   int visitors;
//   String designprice;
//   String shortdescription;
//   String aproximateConstructionCost;
//   String floorfileimageOneurl;
//   String floorfileimageTwourl;
//   String floorfileimageThreeurl;
//   String workingBasementimageOneurl;
//   String workinggroundimageTwourl;
//   String workingfirstimageThreeurl;
//   // String uploadedBy;


  

//   recieveDesignDataFromAdmin({
//     this.uid = '',
//     required this.sortId,
//     required this.shortdescription,
//     required this.designprice,
//     required this.uploadedUserUid,
//     required this.projectDetails,
//     required this.imageOneurl,
//     required this.imageTwourl,
//     required this.imageThreeurl,
//     required this.designType,
//     required this.houseFacing,
//     required this.houseFloors,
//     required this.houseType,
//     required this.houseArea,
//     required this.accordingtoVastu,
//     required this.estimatedConstructionCost,
//     required this.aproximateConstructionCost,
//     required this.postedDate,
//     required this.visitors,
//     required this.floorfileimageOneurl,
//     required this.floorfileimageTwourl,
//     required this.floorfileimageThreeurl,
//     required this.workingBasementimageOneurl,
//     required this.workinggroundimageTwourl,
//     required this.workingfirstimageThreeurl,
//   });

//   factory recieveDesignDataFromAdmin.fromJson(json) =>
//       recieveDesignDataFromAdmin(
//         uploadedUserUid: json['uploadedUserUid'],
//         // profileImgUrl: json['profileImgUrl'],
//         sortId: json['sortId'],
//         designprice: json['designprice'],
//         shortdescription: json['shortdescription'],

//         projectDetails: json['projectDetails'],
//         uid: json['uid'],
//         imageOneurl: json['imageOneurl'],
//         imageTwourl: json['imageTwourl'],
//         imageThreeurl: json['imageThreeurl'],
//         designType: json['designType'],
//         houseFacing: json['houseFacing'],
//         houseFloors: json['houseFloors'],
//         houseType: json['houseType'],
//         houseArea: json['houseArea'],
//         accordingtoVastu: json['accordingtoVastu'],
//         estimatedConstructionCost: json['estimatedConstructionCost'],
//         aproximateConstructionCost: json['aproximateConstructionCost'],

//         postedDate: json['postedDate'],
//         visitors: json['visitors'],

//         floorfileimageOneurl: json['floorfileimageOneurl'],
//         floorfileimageTwourl: json['floorfileimageTwourl'],
//         floorfileimageThreeurl: json['floorfileimageThreeurl'],
//         workingBasementimageOneurl: json['workingBasementimageOneurl'],
//         workinggroundimageTwourl: json['workinggroundimageTwourl'],
//         workingfirstimageThreeurl: json['workingfirstimageThreeurl'],
//       );
// }
