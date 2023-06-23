import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/architectProfile.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/architectprofilepage.dart';
import 'package:dmh_architect/Architect/ArchitectProfile/widgets/ArchitectIndividualMyDesign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../model/uploadDesignDataModel.dart';

import '../../Constants/constants.dart';

class ArchitectMyDesign extends StatelessWidget {
  const ArchitectMyDesign({super.key});

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(15.w),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.to(ArchitectProfilePage()),
                  child: Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                  ),
                ),
                SizedBox(
                  width: 120.w,
                ),
                Text(
                  'My Designs',
                  style: bold18,
                ),
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
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final DesignList = snapshot.data!['myDesigns'];
                  print(DesignList.length);

                  return DesignList.length != null
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            int reverseIndex = DesignList.length-index-1;
                            final data =
                                designDataModel.fromJson(DesignList[reverseIndex]);

                            Timestamp timestamp =
                                DesignList[reverseIndex]['postedDate'];
                            DateTime dateTime = timestamp.toDate();
                            DateTime currentTime = DateTime.now();
                            Duration timeDif = currentTime.difference(dateTime);
                            return GestureDetector(
                              onTap: () =>
                                  Get.to(() => ArchitectIndividualHomeDesign(
                                        designData: data,
                                      )),
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80.w,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: kgreycolor,
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(DesignList[
                                                              reverseIndex]
                                                          ['exteriorImageList']
                                                      [0] ??
                                                  'https://firebasestorage.googleapis.com/v0/b/designmyhouseuser.appspot.com/o/Placeholder%2Fef3-placeholder-image.jpg?alt=media&token=9e009457-de80-44b9-aa42-89b3bf2fb101&_gl=1*op8ful*_ga*MTIxMzcwMjQwOC4xNjg2MDYwMDEz*_ga_CW55HF8NVT*MTY4NjEzNTM2MS42LjEuMTY4NjEzNTkzNi4wLjAuMA..'))),
                                    ),
                                    width10,
                                    SizedBox(
                                      width: 240.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                data.designType,
                                                style: bold16,
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 13.sp,
                                              )
                                            ],
                                          ),
                                          Text(
                                            'DMH${data.sortId}',
                                            // '',
                                            style: normal14,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            timeDif.inSeconds < 60
                                                ? '${timeDif.inSeconds} secounds ago'
                                                : timeDif.inMinutes < 60
                                                    ? '${timeDif.inMinutes} min ago'
                                                    : '${timeDif.inHours} hour ago',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: kgreycolor),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 15.w,
                            );
                          },
                          itemCount: DesignList.length)
                      : SizedBox();
                })
          ],
        ),
      ),
    );
  }
}
