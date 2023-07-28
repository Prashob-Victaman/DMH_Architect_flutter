class designDataModel {
  String uid;
  String uploadedUserUid;
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
  String designprice;
  String shortdescription;
  String uploadedBy;
  List floordetails;
  List exteriorImageList;
  List exteriorImagetitleList;
  List floorImageList;
  List floorImagetitleList;
  List planingFiles;

  designDataModel(
      {this.uid = '',
        required this.shortdescription,
        required this.designprice,
        required this.floordetails,
        required this.sortId,
        required this.uploadedUserUid,
        required this.projectDetails,
        required this.exteriorImageList,
        required this.exteriorImagetitleList,
        required this.floorImageList,
        required this.floorImagetitleList,
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
        required this.uploadedBy,
        required this.planingFiles
      });

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'sortId': sortId,
    'floordetails': floordetails,
    'uploadedUserUid': uploadedUserUid,
    'projectDetails': projectDetails,
    'exteriorImageList': exteriorImageList,
    'exteriorImagetitleList': exteriorImagetitleList,
    'floorImageList': floorImageList,
    'floorImagetitleList': floorImagetitleList,
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
    'designprice': designprice,
    'shortdescription': shortdescription,
    'uploadedBy': uploadedBy,
    'planingFiles':planingFiles
  };

  factory designDataModel.fromJson(json) => designDataModel(
      uploadedUserUid: json['uploadedUserUid'],
      floordetails: json['floordetails'],
      sortId: json['sortId'],
      projectDetails: json['projectDetails'],
      uid: json['uid'],
      exteriorImageList: json['exteriorImageList'],
      exteriorImagetitleList: json['exteriorImagetitleList'],
      floorImageList: json['floorImageList'],
      floorImagetitleList: json['floorImagetitleList'],
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
      designprice: json['designprice'],
      shortdescription: json['shortdescription'],
      uploadedBy: json['uploadedBy'],
      planingFiles:json['planingFiles']
  );
}
