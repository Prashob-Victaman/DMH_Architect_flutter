class designDataModel {
  String uid;
  String uploadedUserUid;
  String imageOneurl;
  String imageTwourl;
  String imageThreeurl;
  int sortId;
  String projectDetails;
  String designType;
  String houseFacing;
  String houseFloors;
  String houseType;
  Map houseArea;
  String accordingtoVastu;
  String estimatedConstructionCost;
  String aproximateConstructionCost;
  var postedDate;
  int visitors;
  String floorfileimageOneurl;
  String floorfileimageTwourl;
  String floorfileimageThreeurl;
  String workingBasementimageOneurl;
  String workinggroundimageTwourl;
  String workingfirstimageThreeurl;
  String designprice;
  String shortdescription;
  String uploadedBy;

  
  designDataModel({
    this.uid = '',
    required this.shortdescription,
    required this.designprice,
    required this.sortId,
    required this.uploadedUserUid,
    required this.projectDetails,
    required this.imageOneurl,
    required this.imageTwourl,
    required this.imageThreeurl,
    required this.designType,
    required this.houseFacing,
    required this.houseFloors,
    required this.houseType,
    required this.houseArea,
    required this.accordingtoVastu,
    required this.estimatedConstructionCost,
    required this.aproximateConstructionCost,
    required this.postedDate,
    required this.visitors,
    required this.floorfileimageOneurl,
    required this.floorfileimageTwourl,
    required this.floorfileimageThreeurl,
    required this.workingBasementimageOneurl,
    required this.workinggroundimageTwourl,
    required this.workingfirstimageThreeurl,
    required this.uploadedBy
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'sortId': sortId,
        'uploadedUserUid': uploadedUserUid,
        'projectDetails': projectDetails,
        'imageOneurl': imageOneurl,
        'imageTwourl': imageTwourl,
        'imageThreeurl': imageThreeurl,
        'designType': designType,
        'houseFacing': houseFacing,
        'houseFloors': houseFloors,
        'houseType': houseType,
        'houseArea': houseArea,
        'accordingtoVastu': accordingtoVastu,
        'estimatedConstructionCost': estimatedConstructionCost,
        'aproximateConstructionCost': aproximateConstructionCost,
        'postedDate': postedDate,
        'visitors': visitors,
        'floorfileimageOneurl': floorfileimageOneurl,
        'floorfileimageTwourl': floorfileimageTwourl,
        'floorfileimageThreeurl': floorfileimageThreeurl,
        'workingBasementimageOneurl': workingBasementimageOneurl,
        'workinggroundimageTwourl': workinggroundimageTwourl,
        'workingfirstimageThreeurl': workingfirstimageThreeurl,
        'designprice': designprice,
        'shortdescription': shortdescription,
        'uploadedBy':uploadedBy
      };

  factory designDataModel.fromJson(json) => designDataModel(
        uploadedUserUid: json['uploadedUserUid'],
        sortId: json['sortId'],
        projectDetails: json['projectDetails'],
        uid: json['uid'],
        imageOneurl: json['imageOneurl'],
        imageTwourl: json['imageTwourl'],
        imageThreeurl: json['imageThreeurl'],
        designType: json['designType'],
        houseFacing: json['houseFacing'],
        houseFloors: json['houseFloors'],
        houseType: json['houseType'],
        houseArea: json['houseArea'],
        accordingtoVastu: json['accordingtoVastu'],
        estimatedConstructionCost: json['estimatedConstructionCost'],
        aproximateConstructionCost: json['aproximateConstructionCost'],
        postedDate: json['postedDate'],
        visitors: json['visitors'],
        floorfileimageOneurl: json['floorfileimageOneurl'],
        floorfileimageTwourl: json['floorfileimageTwourl'],
        floorfileimageThreeurl: json['floorfileimageThreeurl'],
        workingBasementimageOneurl: json['workingBasementimageOneurl'],
        workinggroundimageTwourl: json['workinggroundimageTwourl'],
        workingfirstimageThreeurl: json['workingfirstimageThreeurl'],
        designprice: json['designprice'],
        shortdescription: json['shortdescription'],
        uploadedBy:json['uploadedBy']

      );
}
