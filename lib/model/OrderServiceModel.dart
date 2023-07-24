class OrderServiceModel {
  String architectName;
  String orderId;
  bool isOrderAproved;
  var orderDatetime;
  String designType;
  String houseType;
  Map houseArea;
  String houseFacing;
  String servicesname;
  List requirementData;
  Map averageAreaDimension;
  Map requestList;
  String customerUid;
  String customerName;
  String architectUid;
  String orderUid;
  String deliveryDate;
  double amount;

  OrderServiceModel(
      {required this.architectName,
        required this.orderId,
        required this.isOrderAproved,
        required this.orderDatetime,
        required this.designType,
        required this.houseType,
        required this.houseArea,
        required this.houseFacing,
        required this.servicesname,
        required this.requirementData,
        required this.requestList,
        required this.averageAreaDimension,
        required this.customerUid,
        required this.customerName,
        required this.architectUid,
        required this.orderUid,
        required this.deliveryDate,
        required this.amount
      });

  Map<String, dynamic> toJson() => {
    'architectName': architectName,
    'orderId': orderId,
    'isOrderAproved': isOrderAproved,
    'orderDatetime': orderDatetime,
    'designType': designType,
    'houseType': houseType,
    'houseArea': houseArea,
    'houseFacing': houseFacing,
    'servicesSelectedModel': servicesname,
    'requirementData': requirementData,
    'averageAreaDimension': averageAreaDimension,
    'requestList': requestList,
    'customerName': customerName,
    'customerUid': customerUid,
    'architectUid': architectUid,
    'orderUid': orderUid,
    'deliveryDate': deliveryDate,
    'amount':amount
  };

  factory OrderServiceModel.fromJson(json) => OrderServiceModel(
      orderId: json['orderId'],
      architectName: json['architectName'],
      isOrderAproved: json['isOrderAproved'],
      orderDatetime: json['orderDatetime'],
      designType: json['designType'],
      houseType: json['houseType'],
      houseArea: json['houseArea'],
      houseFacing: json['houseFacing'],
      servicesname: json['servicesSelectedModel'],
      requirementData: json['requirementData'],
      averageAreaDimension: json['averageAreaDimension'],
      requestList: json['requestList'],
      customerName: json['customerName'],
      customerUid: json['customerUid'],
      architectUid: json['architectUid'],
      orderUid: json['orderUid'],
      deliveryDate: json['deliveryDate'],
      amount:json['amount']
  );
}
