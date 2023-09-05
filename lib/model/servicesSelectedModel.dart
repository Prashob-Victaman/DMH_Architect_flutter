class servicesSelectedModel {
  String serviceName;
  bool? isSelected;
  bool isProcessStarted;
  bool isCompleted;
  bool isPaid;
  bool isPlanUplaoded;
  bool isAproved;
  var deliveryDate;
  String amount;
  Map planurl;
  bool isRejected;
  int numberOfchangesDone;
  bool requestChange;

  servicesSelectedModel(
      {required this.serviceName,
        this.isSelected,
        required this.isProcessStarted,
        required this.isCompleted,
        required this.isPaid,
        required this.isPlanUplaoded,
        required this.isAproved,
        required this.deliveryDate,
        required this.amount,
        required this.planurl,
        required this.isRejected,
        required this.numberOfchangesDone,
        required this.requestChange});

  Map<String, dynamic> toJson() => {
    'serviceName': serviceName,
    'isSelected': isSelected,
    'isProcessStarted': isProcessStarted,
    'isCompleted': isCompleted,
    'isPlanUplaoded': isPlanUplaoded,
    'isPaid': isPaid,
    'deliveryDate': deliveryDate,
    'amount': amount,
    'planurl': planurl,
    'isAproved': isAproved,
    'isRejected': isRejected,
    'numberOfchangesDone': numberOfchangesDone,
    'requestChange': requestChange
  };

  factory servicesSelectedModel.fromJson(json) => servicesSelectedModel(
    serviceName: json['serviceName'],
    isProcessStarted: json['isProcessStarted'],
    isSelected: json['isSelected'],
    isCompleted: json['isCompleted'],
    isPlanUplaoded: json['isPlanUplaoded'],
    isPaid: json['isPaid'],
    amount: json['amount'],
    deliveryDate: json['deliveryDate'],
    planurl: json['planurl'],
    isAproved: json['isAproved'],
    isRejected: json['isRejected'],
    numberOfchangesDone: json['numberOfchangesDone'],
    requestChange: json['requestChange'],
  );
}
