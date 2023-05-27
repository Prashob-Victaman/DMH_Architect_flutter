import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../../../getDesign/chooseArchitect.dart';
import '../../Architecthomepage/widgets/reasontoorderhousegridview.dart';

class DesignThisTypeOfHouse extends StatelessWidget {
  DesignThisTypeOfHouse({super.key});

  TextEditingController widthcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: ListView(
            children: [
              heigh10,
              GestureDetector(
                onTap: () => Get.back(),
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
              Text(
                'Put your construction house size',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: kprimarycolor),
              ),
              heigh10,
              Container(
                padding: EdgeInsets.only(left: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: kwhitecolor,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        spreadRadius: .1,
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(137, 82, 82, 82),
                        blurRadius: 4.0,
                        offset: Offset(0.0, 0.0))
                  ],
                ),
                height: 110.w,
                width: screenWidth - 20.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your average house Width ',
                          style: bold15,
                        ),
                        width10,
                        SizedBox(
                          width: 70.w,
                          height: 30.w,
                          child: TextFormField(
                            controller: widthcontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Estimated cost';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                            keyboardType: TextInputType.number,
                            decoration: customInputDecoration('width'),
                          ),
                        ),
                        width5,
                        Text(
                          'Ft.',
                          style: bold15,
                        )
                      ],
                    ),
                    heigh10,
                    Row(
                      children: [
                        Text(
                          'Your average house Height',
                          style: bold15,
                        ),
                        width10,
                        SizedBox(
                          width: 70.w,
                          height: 30.w,
                          child: TextFormField(
                            controller: heightcontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Estimated cost';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                            keyboardType: TextInputType.number,
                            decoration: customInputDecoration('Height'),
                          ),
                        ),
                        width5,
                        Text(
                          'Ft.',
                          style: bold15,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              heigh10,
              heigh5,
              Container(
                  padding: EdgeInsets.only(left: 10.w, top: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: kwhitecolor,
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          spreadRadius: .1,
                          blurStyle: BlurStyle.normal,
                          color: Color.fromARGB(137, 82, 82, 82),
                          blurRadius: 4.0,
                          offset: Offset(0.0, 0.0))
                    ],
                  ),
                  //height: 80.w,
                  width: screenWidth - 20.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.12,
                        child: Text(
                          'Note',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: kprimarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.78,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1. We are contact you after order done for your actual Constructing House Size & Requerements in Details',
                              style: normal12,
                            ),
                            heigh10,
                            Text(
                              '2. You will be paid amount after final Design Discussion',
                              style: normal12,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              heigh10,
              Text(
                'Reason To Order House Designs',
                style: bold18,
              ),
              heigh10,
              const reasontoorderhousegridview(),
              heigh20,
              GestureDetector(
                onTap: () {
                  Get.to(() => ChooseArchitect());
                },
                child: Container(
                  alignment: Alignment.center,
                  width: (screenWidth - 20),
                  height: 40.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      color: kprimarycolor),
                  child: Text(
                    'Design Our House in ${widthcontroller.text} x ${heightcontroller.text} =    Sqft Area',
                    style: TextStyle(fontSize: 14.sp, color: kwhitecolor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
