import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';

class houserenewgridview extends StatelessWidget {
  const houserenewgridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0.w),
      child: GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 1.sp,
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 75.w,
                  width: 115.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(houserenewimages[index])),
                    color: kgreycolor,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                ),
                heigh5,
                Text(
                  textAlign: TextAlign.center,
                  houserenewname[index],
                  style: normal14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
