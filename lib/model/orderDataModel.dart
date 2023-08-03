class OrderDataModel {
  String architectName;
  String orderId;
  bool isOrderAproved;
  var orderDatetime;
  String designType;
  String houseType;
  Map houseArea;
  String houseFacing;
  List serviceRateamountList;
  List requirementData;
  Map averageAreaDimension;
  Map requestList;
  String customerUid;
  String customerName;
  String architectUid;
  String designUid;
  var constomerLocation;
  double distanceBetweenSiteandArchitectKm;
  OrderDataModel(
      {required this.architectName,
        required this.orderId,
        required this.isOrderAproved,
        required this.orderDatetime,
        required this.designType,
        required this.houseType,
        required this.houseArea,
        required this.houseFacing,
        required this.serviceRateamountList,
        required this.requirementData,
        required this.requestList,
        required this.averageAreaDimension,
        required this.customerUid,
        required this.customerName,
        required this.architectUid,
        required this.designUid,
        required this.constomerLocation,
        required this.distanceBetweenSiteandArchitectKm});

  Map<String, dynamic> toJson() => {
    'architectName': architectName,
    'orderId': orderId,
    'isOrderAproved': isOrderAproved,
    'orderDatetime': orderDatetime,
    'designType': designType,
    'houseType': houseType,
    'houseArea': houseArea,
    'houseFacing': houseFacing,
    'servicesSelectedModel': serviceRateamountList,
    'requirementData': requirementData,
    'averageAreaDimension': averageAreaDimension,
    'requestList': requestList,
    'customerName': customerName,
    'customerUid': customerUid,
    'architectUid': architectUid,
    'designUid': designUid,
    'constomerLocation': constomerLocation,
    'distanceBetweenSiteandArchitectKm': distanceBetweenSiteandArchitectKm
  };

  factory OrderDataModel.fromJson(json) => OrderDataModel(
    orderId: json['orderId'],
    architectName: json['architectName'],
    isOrderAproved: json['isOrderAproved'],
    orderDatetime: json['orderDatetime'],
    designType: json['designType'],
    houseType: json['houseType'],
    houseArea: json['houseArea'],
    houseFacing: json['houseFacing'],
    serviceRateamountList: json['servicesSelectedModel'],
    requirementData: json['requirementData'],
    averageAreaDimension: json['averageAreaDimension'],
    requestList: json['requestList'],
    customerName: json['customerName'],
    customerUid: json['customerUid'],
    architectUid: json['architectUid'],
    designUid: json['designUid'],
    constomerLocation: json['constomerLocation'],
    distanceBetweenSiteandArchitectKm:
    json['distanceBetweenSiteandArchitectKm'],
  );
}
