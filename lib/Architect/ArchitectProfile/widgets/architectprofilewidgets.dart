import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';

class architectprofilewidgets extends StatelessWidget {
  Icon icon;
  String title;
  String subtitle;
  Icon trailing;

  architectprofilewidgets(
      {super.key,
      required this.icon,
      required this.trailing,
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: kbluecolor.withOpacity(0.05),
            radius: 20.w,
            child: icon),
        width10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: bold13,
            ),
            heigh5,
            Text(subtitle, style: normal11),
          ],
        ),
        const Spacer(),
        trailing
      ],
    );
  }
}

class architectprofilewidgetdown extends StatelessWidget {
  Icon icon;
  String title;
  Icon trailing;

  architectprofilewidgetdown(
      {super.key,
      required this.icon,
      required this.trailing,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: kbluecolor.withOpacity(0.05),
            radius: 20.w,
            child: icon),
        width10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: bold13,
            ),
          ],
        ),
        const Spacer(),
        trailing
      ],
    );
  }
}
