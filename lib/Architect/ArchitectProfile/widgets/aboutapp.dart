import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24.sp,
                  )),
              Text(
                'Design my house',
                style: bold18,
              ),
              SizedBox(
                width: 60.w,
              )
            ],
          ),
          Container(
            width: screenwidth,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              "Design My House is Planning wing of SIPL(Sawna Infrabuild Private Limited). SIPL is a registered construction company which provides complete housing solutions starting from Planning to Finishing (Naksha se Nirman tak). SIPL reputedly is in market since 1999. Designmyhouse.app have an innovative & expert team of Professional Architects/Engineers who are providing Customer satisfaction oriented services with undermentioned specifications:",
              style: TextStyle(fontSize: 16.sp),
          textAlign: TextAlign.justify,  ),
          )
        ],
      ),
    );
  }
}
