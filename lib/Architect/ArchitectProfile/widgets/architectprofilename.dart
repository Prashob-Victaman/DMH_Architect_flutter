import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';

class architectprofilename extends StatelessWidget {
  const architectprofilename({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      height: 89,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w), color: kprimarycolor),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("ArchitectData")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return SizedBox(
                height: 19.w,
              );
            }
            if (!snapshot.hasData) {
              return Center(
                  child: SizedBox(
                height: 19.w,
              ));
            }

            final data = snapshot.data;

            final Username = data!['name'];
            // final lastname = data['ProfileDetails']['lastName'];

            final email = data['email'];

            return Row(
              children: [
                CircleAvatar(
                  radius: 26.w,
                  child: Image.asset('asset/user.png'),
                ),
                width10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$Username ',
                      style: TextStyle(
                          fontSize: 16.w,
                          color: kwhitecolor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 14.w,
                        color: kwhitecolor,
                      ),
                    )
                  ],
                )
              ],
            );
          }),
    );
  }
}
