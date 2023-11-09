import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/architectprofilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Constants/constants.dart';

class DesignsSold extends StatefulWidget {
  const DesignsSold({Key? key}) : super(key: key);

  @override
  State<DesignsSold> createState() => _DesignsSoldState();
}

class _DesignsSoldState extends State<DesignsSold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.w),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.to(() => ArchitectProfilePage()),
                  child: Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                  ),
                ),
                const Spacer(),
                Text(
                  'My Sold Designs',
                  style: bold18,
                ),
                const Spacer()
              ],
            ),
            heigh10,
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
                  var DesignsSoldList;
                  try {
                    DesignsSoldList = snapshot.data!['DesignsSold'];
                  } catch (e) {
                    DesignsSoldList = [];
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15.w,
                      );
                    },
                    itemBuilder: (context, index) {
                      int reverseIndex = DesignsSoldList.length - index - 1;
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                width10,
                                Container(
                                  height: 90.w,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      color: kgreycolor,
                                      borderRadius: BorderRadius.circular(5.w),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(DesignsSoldList[
                                                      reverseIndex]
                                                  ['exteriorImageList'][0] ??
                                              'https://firebasestorage.googleapis.com/v0/b/designmyhouse-c26d9.appspot.com/o/placeholder%2Fef3-placeholder-image.jpg?alt=media&token=1369f624-05c2-409b-9961-d3112981d4c4'))),
                                ),
                                width10,
                                SizedBox(
                                  width: 230.w,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Customer:',
                                            style: bold12,
                                          ),
                                          width10,
                                          Text(
                                            DesignsSoldList[reverseIndex]
                                                ['customerName'],
                                            style: bold15,
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'amount received:',
                                            style: bold12,
                                          ),
                                          width10,
                                          Text(
                                            '${DesignsSoldList[reverseIndex]['amount']}',
                                            style: bold15,
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Text('Design ID:',
                                      //       style: bold12,
                                      //     ),
                                      //     width10,
                                      //     Text('${DesignsSoldList[reverseIndex]['designUid']}',
                                      //       style: bold15,
                                      //     ),
                                      //   ],
                                      // ),
                                      Row(
                                        children: [
                                          Text(
                                            'Date:',
                                            style: bold12,
                                          ),
                                          width10,
                                          Text(
                                            '${DesignsSoldList[reverseIndex]['dateTime'].toString().split(' ').first}',
                                            style: bold15,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Order Id:',
                                            style: bold12,
                                          ),
                                          width10,
                                          Text(
                                            '${DesignsSoldList[reverseIndex]['orderId']}',
                                            style: bold15,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Payment ID:',
                                            style: bold12,
                                          ),
                                          width10,
                                          Text(
                                            '${DesignsSoldList[reverseIndex]['merchantTransactionId']}',
                                            style: bold15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: DesignsSoldList.length,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
