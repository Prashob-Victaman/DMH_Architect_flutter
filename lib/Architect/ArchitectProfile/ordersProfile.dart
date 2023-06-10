import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ordersProfile extends StatelessWidget {
  const ordersProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          heigh10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Container(
              child: Text(
                'Orders',
                style: bold18,
              ),
            ),
          ),
          ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: kgreycolor),
                  // height: 220.w,
                  child: Column(
                    children: [
                      Container(
                        height: 160.w,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.w),
                                    topRight: Radius.circular(10.w)),
                                // image: DecorationImage(
                                //     fit: BoxFit.cover,
                                //     image: NetworkImage(
                                //         data.exteriorImageList[0])),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.w),
                                          bottomRight: Radius.circular(10.w)),
                                      color: Color.fromARGB(255, 255, 214, 69)),
                                  height: 22.w,
                                  width: (screenwidth - 30) / 2.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Simple',
                                        style: TextStyle(
                                            fontSize: 12.sp, color: kredcolor),
                                      ),
                                      Text(
                                        '/Simplex',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12.sp, color: kbluecolor),
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        // height: 60.w,
                        decoration: BoxDecoration(
                          color: kwhitecolor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.w),
                              bottomRight: Radius.circular(10.w)),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                spreadRadius: .1,
                                blurStyle: BlurStyle.normal,
                                color: Color.fromARGB(137, 82, 82, 82),
                                blurRadius: 10.0,
                                offset: Offset(0.0, 0.0))
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Costomer Name: ',
                                    style: normal14,
                                  ),
                                  Text(
                                    'Prashob',
                                    style: bold16,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total Area: ',
                                    style: normal14,
                                  ),
                                  Text(
                                    '3423 sqft',
                                    style: bold16,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Contact No.: ',
                                    style: normal14,
                                  ),
                                  Text(
                                    '9898767788',
                                    style: bold16,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Price : ',
                                    style: normal14,
                                  ),
                                  Text(
                                    '199.00',
                                    style: bold16,
                                  )
                                ],
                              ),
                              heigh10
                            ]),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 15.w,
                );
              },
              itemCount: 10),
        ],
      )),
    );
  }
}
