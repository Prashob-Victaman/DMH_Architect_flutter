
class notificationModel {
  String uid;
  var time;
  String title;
  String imgUrl;
  int sortid;

  notificationModel(
      {required this.time,
      required this.imgUrl,
      required this.title,
      required this.sortid,
      required this.uid});

  Map<String, dynamic> toJson() => {
        'title': title,
        'time': time,
        'uid': uid,
        'sortid': sortid,
        'imgUrl': imgUrl,
      };

  factory notificationModel.fromJson(json) => notificationModel(
        time: json['time'],
        title: json['title'],
        uid: json['uid'],
        sortid: json['sortid'],
        imgUrl: json['imgUrl'],
      );
}
