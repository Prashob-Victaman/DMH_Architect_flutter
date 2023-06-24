import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/OrdrHistory/orderHistory.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// String? orderUidpublic;

class ordersProfile extends StatelessWidget {
  const ordersProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("ArchitectData")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                var designList;

                try {
                  designList = snapshot.data!['orders'];
                } catch (e) {
                  designList = [];
                }

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
                      physics: const ScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, index) {
                                int reverseIndex =
                                    designList.length - index - 1;

                                final image =
                                    designList[reverseIndex]['imageList'];

                                Timestamp timestamp =
                                    designList[reverseIndex]['dateTime'];
                                DateTime dateTime = timestamp.toDate();
                                DateTime currentTime = DateTime.now();
                                Duration timeDif =
                                    currentTime.difference(dateTime);

                                    print( designList[reverseIndex]
                                                ['orderUId'],);

                                // orderUidpublic =
                                //     designList[reverseIndex]['orderUId'];
                                return GestureDetector(
                                  onTap: () => Get.to(() => OrderHistoryUser(
                                            orderUid: designList[reverseIndex]
                                                ['orderUId'],
                                            architectName:
                                                designList[reverseIndex]
                                                    ['architectName'],
                                            imageUrlList: image,
                                            dateTime: dateTime,
                                            orderId: designList[reverseIndex]
                                                ['orderId'],
                                          )

                                      // individualOrder(
                                      //   orderId: designList[reverseIndex]['orderUId'],
                                      // ),
                                      ),
                                  child: Container(
                                    // padding: EdgeInsets.all(10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      // color: kgreycolor,
                                    ),
                                    width: screenwidth - 20.w,
                                    // height: 100.w,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 90.w,
                                          width: 100.w,
                                          child: CachedNetworkImage(
                                            imageUrl: image[0],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              height: 90.w,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.w),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: imageProvider),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Container(
                                        //   height: 90.w,
                                        //   width: 100.w,
                                        //   decoration: BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.circular(5.w),
                                        //       image: DecorationImage(
                                        //           fit: BoxFit.cover,
                                        //           image:
                                        //               NetworkImage(image[0]))),
                                        // ),
                                        width10,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${designList[reverseIndex]['orderId']}',
                                              style: bold16,
                                            ),
                                            Text(
                                              '${designList[reverseIndex]['customerName']}',
                                              style: normal16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              '${designList[reverseIndex]['customeNumber']}',
                                              style: normal16,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'Distance: ${designList[reverseIndex]['distanceFromClient'].toStringAsFixed(2)} KM',
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
              }),
        ],
      )),
    );
  }
}
