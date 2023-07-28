class designDataFromAdmin {
  String uid;
  String uploadedUserUid;
  List exteriorImageList;
  List exteriorImagetitleList;
  List floorImageList;
  List floorImagetitleList;
  String uploadedBy;
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
  List floordetails;
  List planingFiles;


  designDataFromAdmin({
    this.uid = '',
    required this.shortdescription,
    required this.floordetails,
    required this.uploadedBy,
    required this.designprice,
    required this.sortId,
    required this.uploadedUserUid,
    required this.projectDetails,
    required this.floorImageList,
    required this.floorImagetitleList,
    required this.exteriorImageList,
    required this.exteriorImagetitleList,
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
    required this.planingFiles,
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
        'designType': designType,
        'floorImagetitleList': floorImagetitleList,
        'houseFacing': houseFacing,
        'houseFloors': houseFloors,
        'houseType': houseType,
        'houseArea': houseArea,
        'accordingtoVastu': accordingtoVastu,
        'estimatedConstructionCost': estimatedConstructionCost,
        'aproximateConstructionCost': aproximateConstructionCost,
        'postedDate': postedDate,
        'uploadedBy': uploadedBy,
        'visitors': visitors,
        'planingFiles': planingFiles,
        'designprice': designprice,
        'shortdescription': shortdescription,
      };

  factory designDataFromAdmin.fromJson(json) => designDataFromAdmin(
        uploadedUserUid: json['uploadedUserUid'],
        uploadedBy: json['uploadedBy'],
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
        planingFiles: json['planingFiles'],
        designprice: json['designprice'],
        shortdescription: json['shortdescription'],
      );
}
