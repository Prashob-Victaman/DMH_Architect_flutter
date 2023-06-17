class OrderModel {
  var sortId;
  String uid;
  bool isOrderConfirmed;
  String initialPayment;
  bool isinitialPaymentDone;
  Map uploadRequirements;
  bool isUploadRequirements;
  bool planningWorkingProgress;
  String expectedDelivery;
  String floorPlanData;
  bool floorPlanDataUpload;
  String secondaryAmount;
  bool issecondaryAmountPaid;
  bool isExpectedDeliveryAdded;
  bool isPlanRecieved;
  bool isWorkStarted;
  bool isRejected;
  var dateTime;
  var orderId;
  String designUid;
  String userName;
  String userMobile;
  bool isInitialpaymentAdded;
  bool isSecondaryPamentAdded;

  OrderModel({
    required this.uid,
    required this.isOrderConfirmed,
    required this.isinitialPaymentDone,
    required this.initialPayment,
    required this.uploadRequirements,
    required this.isUploadRequirements,
    required this.planningWorkingProgress,
    required this.floorPlanData,
    required this.expectedDelivery,
    required this.floorPlanDataUpload,
    required this.secondaryAmount,
    required this.issecondaryAmountPaid,
    required this.isExpectedDeliveryAdded,
    required this.isPlanRecieved,
    required this.isWorkStarted,
    required this.dateTime,
    required this.orderId,
    required this.designUid,
    required this.userName,
    required this.userMobile,
    required this.sortId,
    required this.isRejected,
    required this.isInitialpaymentAdded,
    required this.isSecondaryPamentAdded,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'isOrderConfirmed': isOrderConfirmed,
        'initialPayment': initialPayment,
        'isinitialPaymentDone': isinitialPaymentDone,
        'uploadRequirements': uploadRequirements,
        'isUploadRequirements': isUploadRequirements,
        'planningWorkingProgress': planningWorkingProgress,
        'floorPlanData': floorPlanData,
        'expectedDelivery': expectedDelivery,
        'floorPlanDataUpload': floorPlanDataUpload,
        'secondaryAmount': secondaryAmount,
        'issecondaryAmountPaid': issecondaryAmountPaid,
        'isExpectedDeliveryAdded': isExpectedDeliveryAdded,
        'isPlanRecieved': isPlanRecieved,
        'isWorkStarted': isWorkStarted,
        'dateTime': dateTime,
        'orderId': orderId,
        'designUid': designUid,
        'userName': userName,
        'userMobile': userMobile,
        'sortId': sortId,
        'isRejected': isRejected,
        'isInitialpaymentAdded': isInitialpaymentAdded,
        'isSecondaryPamentAdded': isSecondaryPamentAdded,
      };

  factory OrderModel.fromJson(json) => OrderModel(
        initialPayment: json['initialPayment'],
        isOrderConfirmed: json['isOrderConfirmed'],
        uid: json['uid'],
        isinitialPaymentDone: json['isinitialPaymentDone'],
        uploadRequirements: json['uploadRequirements'],
        isUploadRequirements: json['isUploadRequirements'],
        planningWorkingProgress: json['planningWorkingProgress'],
        floorPlanData: json['floorPlanData'],
        expectedDelivery: json['expectedDelivery'],
        floorPlanDataUpload: json['floorPlanDataUpload'],
        secondaryAmount: json['secondaryAmount'],
        issecondaryAmountPaid: json['issecondaryAmountPaid'],
        isExpectedDeliveryAdded: json['isExpectedDeliveryAdded'],
        isPlanRecieved: json['isPlanRecieved'],
        isWorkStarted: json['isWorkStarted'],
        dateTime: json['dateTime'],
        orderId: json['orderId'],
        designUid: json['designUid'],
        userName: json['userName'],
        userMobile: json['userMobile'],
        sortId: json['sortId'],
        isRejected: json['isRejected'],
        isInitialpaymentAdded: json['isInitialpaymentAdded'],
        isSecondaryPamentAdded: json['isSecondaryPamentAdded'],
      );
}
