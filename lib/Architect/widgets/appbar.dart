import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../notification/notification.dart';

class appbar extends StatelessWidget {
  const appbar({
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
          height: 45.w,
          width: 220.w,
          child: Image.asset('asset/DMH- Logo 6.png')),
      actions: [
        GestureDetector(
          onTap: () => Get.to(() => NotificationScreen()),
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
