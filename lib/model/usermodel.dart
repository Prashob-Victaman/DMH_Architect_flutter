// class signupData {
//   String uid;
//   String designation;
//   String email;
//   String? pasword;
//   List cart;
//   List paymentdetails;
//   Map ProfileDetails;
//   List myDesigns;
//   int sortId;



//   signupData(
//       {required this.designation,
//       required this.cart,
//       required this.paymentdetails,
//       required this.ProfileDetails,
//       required this.myDesigns,
//       required this.email,
//       required this.sortId,
//       required this.uid});

//   Map<String, dynamic> toJson() => {
//         'email': email,
//         'ProfileDetails': ProfileDetails,
//         'designation': designation,
//         'uid': uid,
//         'cart': cart,
//         'paymentdetails': paymentdetails,
//         'myDesigns': myDesigns,
//         'sortId': sortId,
//       };

//   factory signupData.fromJson(json) => signupData(
//         designation: json['designation'],
//         email: json['email'],
//         uid: json['uid'],
//         ProfileDetails: json['ProfileDetails'],
//         cart: json['cart'],
//         paymentdetails: json['paymentdetails'],
//         sortId: json['sortId'],
//         myDesigns: json['myDesigns'],
//       );
// }
