class PurchasedDesignsModel {
  String uid;
  int sortId;
  String designType;
  String houseType;
  String houseFloors;
  String projectDetails;
  String accordingtoVastu;
  String userName;
  String designPrice;
  String designerName;
  bool isPaymentDone;
  String userMobileNumber;
  Map plotArea;

  PurchasedDesignsModel(
      {required this.sortId,
      required this.plotArea,
      required this.designType,
      required this.userName,
      required this.userMobileNumber,
      required this.houseType,
      required this.houseFloors,
      required this.projectDetails,
      required this.accordingtoVastu,
      required this.designPrice,
      required this.designerName,
      required this.isPaymentDone,
      required this.uid});

  Map<String, dynamic> toJson() => {
        'designType': designType,
        'houseType': houseType,
        'userName': userName,
        'userMobileNumber': userMobileNumber,
        'houseFloors': houseFloors,
        'plotArea': plotArea,
        'sortId': sortId,
        'projectDetails': projectDetails,
        'accordingtoVastu': accordingtoVastu,
        'designPrice': designPrice,
        'designerName': designerName,
        'isPaymentDone': isPaymentDone,
        'uid': uid,
      };

  factory PurchasedDesignsModel.fromJson(json) => PurchasedDesignsModel(
        sortId: json['sortId'],
        houseType: json['houseType'],
        designType: json['designType'],
        userName: json['userName'],
        userMobileNumber: json['userMobileNumber'],
        houseFloors: json['houseFloors'],
        uid: json['uid'],
        plotArea: json['plotArea'],
        projectDetails: json['projectDetails'],
        accordingtoVastu: json['accordingtoVastu'],
        designPrice: json['designPrice'],
        designerName: json['designerName'],
        isPaymentDone: json['isPaymentDone'],
      );
}
