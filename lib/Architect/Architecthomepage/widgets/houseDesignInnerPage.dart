import 'package:dmh_architect/Architect/ArchitectDrawer/ArchitectDrawerscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';
import '../../widgets/appbar.dart';
import '../separatedDesignlistview.dart';

class houseDesignInnerPage extends StatelessWidget {
  final CategoryData;
  final title;

  const houseDesignInnerPage(
      {super.key, required this.CategoryData, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;

    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: ArchitectDrawerscreen(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.w),
        child: const appbar(),
      ),
      body: Builder(builder: (context) {
        return ListView(children: [
          heigh10,
          heigh5,
          SizedBox(
            child: CategoryData.length == 0
                ? Container(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenheight / 2 - 170.w,
                          ),
                          Icon(
                            Icons.category_outlined,
                            size: 100.sp,
                            color: kprimarycolor,
                          ),
                          Text(
                            'No Design in ${title}',
                            style: bold18,
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14.0.w, top: 10.w),
                        child: Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: kprimarycolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            // width10,
                            // Container(
                            //   color: kblackcolor,
                            //   width: 2.w,
                            //   height: 15.w,
                            // ),
                            // Text(
                            //   'subtitle',
                            //   style: TextStyle(
                            //     fontSize: 14.sp,
                            //     color: kblackcolor,
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      heigh10,
                      separateddesignlistview(
                        screenwidth: screenwidth,
                        CategoryData: CategoryData,
                      ),
                      heigh20
                    ],
                  ),
          )
        ]);
      }),
    );
  }
}
