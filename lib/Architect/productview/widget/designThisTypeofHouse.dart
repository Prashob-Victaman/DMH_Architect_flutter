import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';
import '../../../getDesign/chooseArchitect.dart';
import '../../Architecthomepage/widgets/reasontoorderhousegridview.dart';

class DesignThisTypeOfHouse extends StatelessWidget {
  DesignThisTypeOfHouse({super.key});

  TextEditingController widthcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: formKey,
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
                              textAlignVertical: TextAlignVertical.center,
                              controller: widthcontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: errorcustomInputDecoration('width'),
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
                              textAlignVertical: TextAlignVertical.center,
                              controller: heightcontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: errorcustomInputDecoration('Height'),
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
                            ),
                            heigh10
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
                  final form = formKey.currentState;

                  if (form!.validate()) {
                    form.save();
                    Get.to(() => ChooseArchitect(
                          area:
                              '${(widthcontroller.text.isNotEmpty && heightcontroller.text.isNotEmpty && double.tryParse(widthcontroller.text) != null && double.tryParse(heightcontroller.text) != null) ? ((double.parse(widthcontroller.text) * double.parse(heightcontroller.text)).toStringAsFixed(2)) : '0'}',
                        ));
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Enter Your House Width & Height');
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: (screenWidth - 20),
                  height: 40.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      color: kprimarycolor),
                  child: Text(
                    'Design Our House in ${widthcontroller.text} x ${heightcontroller.text} =  ${(widthcontroller.text.isNotEmpty && heightcontroller.text.isNotEmpty && double.tryParse(widthcontroller.text) != null && double.tryParse(heightcontroller.text) != null) ? ((double.parse(widthcontroller.text) * double.parse(heightcontroller.text)).toStringAsFixed(2)) : '0'} Sqft Area',
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

  errorcustomInputDecoration(String hint) {
    return InputDecoration(
        errorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Color.fromARGB(255, 255, 0, 0)),
        ),
        errorStyle:
            TextStyle(height: 0, color: Colors.transparent, fontSize: 1.sp),
        contentPadding: EdgeInsets.symmetric(
          // vertical: 10.0.w,
          horizontal: 10.0.w,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kprimarycolor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16.sp, color: kgreycolor));
  }
}
