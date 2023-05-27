import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';

class reasontoorderhousegridview extends StatelessWidget {
  const reasontoorderhousegridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0.w),
      child: GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 0.75,
        crossAxisCount: 4,
        children: List.generate(8, (index) {
          return GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 75.w,
                  width: 75.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(reasonsimage[index])),
                    color: kgreycolor,
                    borderRadius: BorderRadius.circular(50.w),
                  ),
                ),
                heigh5,
                Text(
                  reasons[index],
                  style: normal12,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
