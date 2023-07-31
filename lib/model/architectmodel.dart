class ArchitectsignupData {
  String uid;
  String designation;
  String name;
  String email;
  String mobilenumber;
  Map personalDetails;
  Map officeDetails;
  List myDesigns;
  String gender;
  int sortId;
  Map serviceRateamountList;
  double totalEarnings;
  ArchitectsignupData({
    required this.uid,
    required this.designation,
    required this.email,
    required this.name,
    required this.mobilenumber,
    required this.personalDetails,
    required this.officeDetails,
    required this.gender,
    required this.myDesigns,
    required this.sortId,
    required this.serviceRateamountList,
    required this.totalEarnings,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'designation': designation,
        'name': name,
        'email': email,
        'mobilenumber': mobilenumber,
        'personalDetails': personalDetails,
        'officeDetails': officeDetails,
        'gender': gender,
        'myDesigns': myDesigns,
        'sortId': sortId,
        'serviceRateamountList': serviceRateamountList,
        'totalEarnings': totalEarnings
      };

  factory ArchitectsignupData.fromJson(json) => ArchitectsignupData(
      name: json['name'],
      designation: json['designation'],
      uid: json['uid'],
      email: json['email'],
      mobilenumber: json['mobilenumber'],
      personalDetails: json['personalDetails'],
      officeDetails: json['officeDetails'],
      gender: json['gender'],
      myDesigns: json['myDesigns'],
      sortId: json['sortId'],
      serviceRateamountList: json['serviceRateamountList'],
      totalEarnings: json['totalEarnings']);
}
