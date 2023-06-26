class OrderDataModel {
  String architectName;
  String orderId;
  bool isOrderAproved;
  var orderDatetime;
  String designType;
  String houseType;
  Map houseArea;
  String houseFacing;
  List servicesSelectedModel;
  List requirementData;
  Map averageAreaDimension;
  Map requestList;

  OrderDataModel(
      {required this.architectName,
      required this.orderId,
      required this.isOrderAproved,
      required this.orderDatetime,
      required this.designType,
      required this.houseType,
      required this.houseArea,
      required this.houseFacing,
      required this.servicesSelectedModel,
      required this.requirementData,
      required this.requestList,
      required this.averageAreaDimension});

  Map<String, dynamic> toJson() => {
        'architectName': architectName,
        'orderId': orderId,
        'isOrderAproved': isOrderAproved,
        'orderDatetime': orderDatetime,
        'designType': designType,
        'houseType': houseType,
        'houseArea': houseArea,
        'houseFacing': houseFacing,
        'servicesSelectedModel': servicesSelectedModel,
        'requirementData': requirementData,
        'averageAreaDimension': averageAreaDimension,
        'requestList': requestList,
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
        servicesSelectedModel: json['servicesSelectedModel'],
        requirementData: json['requirementData'],
        averageAreaDimension: json['averageAreaDimension'],
        requestList: json['requestList'],
      );
}
