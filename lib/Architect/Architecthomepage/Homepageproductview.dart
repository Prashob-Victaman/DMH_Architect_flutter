import 'package:dmh_architect/Architect/Architecthomepage/widgets/productviewcorouselslider.dart';
import 'package:dmh_architect/Architect/Architecthomepage/widgets/projectdescription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Constants/constants.dart';
import '../../controller/CartController.dart';
import '../../getDesign/getDesign.dart';
import '../../model/recievedesignDataFromAdmin.dart';
import '../../model/uploadDesignDataModel.dart';
import '../productview/widget/designThisTypeofHouse.dart';

class Homepageproductview extends StatelessWidget {
  final List<Map<String, dynamic>> DesignData;
  int index;
  Homepageproductview(
      {super.key, required this.DesignData, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final getcontroller = Get.put(CartController());

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    children: [
                      heigh10,
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SizedBox(
                          child: Row(children: [
                            Icon(
                              Icons.arrow_back,
                              size: 20.sp,
                            ),
                            Text(
                              'Back',
                              style: normal16,
                            )
                          ]),
                        ),
                      ),
                      heigh10,
                      Row(
                        children: [
                          Text(
                            DesignData[index]['houseType'],
                            style: TextStyle(
                                fontSize: 14.sp, color: kprimarycolor),
                          ),
                          Text(
                            '/ ${DesignData[index]['designType']}',
                            style:
                                TextStyle(fontSize: 14.sp, color: kblackcolor),
                          )
                        ],
                      ),
                      heigh10,
                      Text(
                        '${DesignData[index]['projectDetails']}',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                productviewcorouselslider(DesignData: DesignData,index: index),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      // onTap: () => Get.to(() => GetDesign(
                      //   DesignData: widget.DesignData,
                      // )),
                      child: Container(
                        alignment: Alignment.center,
                        width: ((screenwidth - 30) / 2.1).w,
                        height: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w),
                            color: kprimarycolor),
                        child: Text(
                          'Get working Drawings',
                          style: TextStyle(
                              fontSize: 14.sp, color: kwhitecolor),
                        ),
                      ),
                    ),
                    width10,
                    GestureDetector(
                      onTap: () => Get.to(() => DesignThisTypeOfHouse()),
                      child: Container(
                        alignment: Alignment.center,
                        width: ((screenwidth - 30) / 2.1).w,
                        height: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w),
                            color: kprimarycolor),
                        child: Text(
                          'Design this type house',
                          style: TextStyle(
                              fontSize: 14.sp, color: kwhitecolor),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    children: [
                      heigh10,
                      HomepageProjectDescription(
                          DesignData: DesignData, index: index),
                      // Row(
                      //   children: [
                      //     Container(
                      //       alignment: Alignment.center,
                      //       width: (screenwidth - 30) / 2,
                      //       height: 30.w,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5.w),
                      //           color: kprimarycolor),
                      //       child: Text(
                      //         'Get working Drawings',
                      //         style: TextStyle(
                      //             fontSize: 14.sp, color: kwhitecolor),
                      //       ),
                      //     ),
                      //     width10,
                      //     Container(
                      //       alignment: Alignment.center,
                      //       width: (screenwidth - 30) / 2,
                      //       height: 30.w,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5.w),
                      //           color: kprimarycolor),
                      //       child: Text(
                      //         'Design this type house',
                      //         style: TextStyle(
                      //             fontSize: 14.sp, color: kwhitecolor),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 80.w,
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: screenheight - 100.w,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        spreadRadius: .5,
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(137, 184, 184, 184),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 0.0))
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => getcontroller.addToCart(
                          amount: DesignData[index]['designprice'],
                          designType: DesignData[index]['designType'],
                          dimensions:
                              '${DesignData[index]['houseArea']['area']} Sqft',
                          houseType: DesignData[index]['houseType'],
                          imgUrl: DesignData[index]['imageOneurl'],
                          ProductUid: DesignData[index]['uid'],
                          userid: FirebaseAuth.instance.currentUser!.uid),
                      child: Container(
                        alignment: Alignment.center,
                        width: (screenwidth) / 2,
                        height: 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10.w)),
                            color: kwhitecolor),
                        child: Text(
                          'Add to cart',
                          style:
                              TextStyle(fontSize: 17.sp, color: kprimarycolor),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        // await FirebaseFirestore.instance
                        //     .collection("PaymentDetails")
                        //     .doc(
                        //         '${DateTime.now().month}_${DateTime.now().year}')
                        //     .update({
                        //   'payments': FieldValue.arrayUnion([
                        //     {
                        //       'name': 'aa',
                        //       'amount': 232,
                        //       'date': Timestamp.now(),
                        //       'transaction': 'response.paymentId',
                        //     }
                        //   ])
                        // });
                        //DesignData[index];
                        designDataModel rd =
                            designDataModel.fromJson(DesignData[index]);
                        Get.to(() => GetDesign(
                              DesignData: rd,
                            ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: (screenwidth) / 2,
                        height: 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10.w)),
                            color: kprimarycolor),
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 17.sp, color: kwhitecolor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
