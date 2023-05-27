import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/constants.dart';
import 'Architectnotification/Architectnotification.dart';

class Architectappbar extends StatelessWidget {
  const Architectappbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.view_headline,
              size: 35,
              color: kblackcolor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      backgroundColor: kwhitecolor,
      title: Container(
          height: 45.w, width: 220.w, child: Image.asset('asset/Logo-03.png')),
      actions: [
        GestureDetector(
          onTap: () => Get.to(() => ArchitectnotificationScreen()),
          child: Padding(
            padding: EdgeInsets.only(right: 10.0.w),
            child: Icon(
              Icons.notifications,
              size: 30.sp,
              color: kblackcolor,
            ),
          ),
        )
      ],
    );
  }
}
