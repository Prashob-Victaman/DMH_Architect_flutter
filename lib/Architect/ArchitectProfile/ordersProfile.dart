import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/orderHistory.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/individualOrder.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ordersProfile extends StatelessWidget {
  const ordersProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("ArchitectData")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final designList = snapshot.data!['orders'];

                return Column(
                  children: [
                    heigh10,
                    Text(
                      'My Orders',
                      style: bold16,
                    ),
                    Divider(
                      height: 10.w,
                      thickness: 1.w,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                final image = designList[index]['imageList'];

                                Timestamp timestamp =
                                    designList[index]['dateTime'];
                                DateTime dateTime = timestamp.toDate();
                                DateTime currentTime = DateTime.now();
                                Duration timeDif =
                                    currentTime.difference(dateTime);
                                return GestureDetector(
                                  onTap: () => Get.to(() => OrderHistoryUser(
                                            architectName: designList[index]
                                                ['architectName'],
                                            imageUrlList: image,
                                            dateTime: dateTime,
                                            orderId: designList[index]
                                                ['orderId'],
                                          )

                                      // individualOrder(
                                      //   orderId: designList[index]['orderUId'],
                                      // ),
                                      ),
                                  child: Container(
                                    // padding: EdgeInsets.all(10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      // color: kgreycolor,
                                    ),
                                    width: screenwidth - 20.w,
                                    height: 100.w,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 90.w,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.w),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      NetworkImage(image[0]))),
                                        ),
                                        width10,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${designList[index]['orderId']}',
                                              style: bold16,
                                            ),
                                            Text(
                                              '${designList[index]['customerName']}',
                                              style: normal16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              '${designList[index]['customeNumber']}',
                                              style: normal16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'Distance: ${designList[index]['distanceFromClient'].toStringAsFixed(2)} KM',
                                              style: normal16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              timeDif.inSeconds < 60
                                                  ? '${timeDif.inSeconds} seconds ago'
                                                  : timeDif.inMinutes < 60
                                                      ? '${timeDif.inMinutes} min ago'
                                                      : '${timeDif.inHours} hour ago',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: kgreycolor),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 20.w,
                                  thickness: 1.w,
                                );
                              },
                              itemCount: designList.length),
                        )
                      ],
                    ),
                  ],
                );
              })),
    );
  }
}
