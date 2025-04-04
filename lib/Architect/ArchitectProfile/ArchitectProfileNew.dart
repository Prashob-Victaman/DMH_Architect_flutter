import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/controller/MyProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  bool option = true;

  final getMyProfileController = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kashcolor,
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        foregroundColor: kwhitecolor,
        centerTitle: true,
        title: Title(
            color: kwhitecolor,
            child: Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 16,
                  color: kwhitecolor,
                  fontWeight: FontWeight.bold),
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0.w),
            child: SizedBox(
              width: 70.w,
              height: 35.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kwhitecolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(0)),
                onPressed: () {},
                child: Text(
                  'Save',
                  style: bold16,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          children: [
            GetBuilder<MyProfileController>(builder: (getData) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            getData.changeshowPersonalDetails(
                                !getData.showPersonalDetails);
                          },
                          icon: getData.showPersonalDetails
                              ? Icon(Icons.arrow_drop_down)
                              : Icon(Icons.arrow_drop_up),
                        ),
                        Text(
                          'Personal Details',
                          style: TextStyle(
                              color: kbluecolor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    getData.showPersonalDetails
                        ? Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 180.w,
                                height: 180.w,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cloud_upload_rounded,
                                      size: 60.sp,
                                    ),
                                    Text(
                                      'Upload Profile Picture',
                                      style: normal12,
                                    ),
                                    heigh20
                                  ],
                                ),
                              ),
                              heigh10,
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              heigh10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: screenWidth * 0.42,
                                      height: 45,
                                      child: fielddecoration(
                                        labelText: 'Date of birth',
                                      )),
                                  // width10,
                                  SizedBox(
                                      width: screenWidth * 0.42,
                                      height: 45,
                                      child: fielddecoration(
                                        labelText: 'Gender',
                                      )),
                                ],
                              ),
                              heigh10,
                              SizedBox(
                                  height: 45,
                                  child: fielddecoration(
                                    labelText: 'Mobile Number',
                                  )),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Whatsapp Number',
                                ),
                              ),
                              heigh10,
                              Text(
                                'Permanent Address',
                                style: bold16,
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Village/Colony',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Block/Panchayath',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'City/Town',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'State',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'PIN',
                                ),
                              ),
                              heigh10,
                            ],
                          )
                        : SizedBox()
                  ],
                ),
              );
            }),
            heigh20,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: option
                            ? Icon(Icons.arrow_drop_down)
                            : Icon(Icons.arrow_drop_up),
                      ),
                      Text(
                        'Professional Qualification',
                        style: TextStyle(
                            color: kbluecolor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 45,
                        child: fielddecoration(
                          labelText: 'Certificate Name',
                        ),
                      ),
                      heigh10,
                      Container(
                        alignment: Alignment.center,
                        width: 200.w,
                        height: 140.w,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_rounded,
                              size: 60.sp,
                            ),
                            Text(
                              'Upload Certificate Photo',
                              style: normal12,
                            ),
                            heigh20
                          ],
                        ),
                      ),
                      heigh10
                    ],
                  )
                ],
              ),
            ),
            heigh20,
            GetBuilder<MyProfileController>(builder: (getData) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            getData.changesshowOfficeDetails(
                                !getData.showOfficeDetails);
                          },
                          icon: getData.showOfficeDetails
                              ? Icon(Icons.arrow_drop_down)
                              : Icon(Icons.arrow_drop_up),
                        ),
                        Text('Office/Firm Details',
                            style: TextStyle(
                                color: kbluecolor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    getData.showOfficeDetails
                        ? Column(
                            children: [
                              SizedBox(
                                  height: 45,
                                  child: fielddecoration(
                                    labelText: 'Shop No.',
                                  )),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Floor',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Building Name',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Block/Panchyath',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'City/Town',
                                ),
                              ),
                              heigh10,
                            ],
                          )
                        : SizedBox()
                  ],
                ),
              );
            }),
            heigh20,
            GetBuilder<MyProfileController>(builder: (getData) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            getData.changesshowBankDetails(
                                !getData.showBankDetails);
                          },
                          icon: getData.showBankDetails
                              ? Icon(Icons.arrow_drop_down)
                              : Icon(Icons.arrow_drop_up),
                        ),
                        Text('Bank Details',
                            style: TextStyle(
                                color: kbluecolor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    getData.showBankDetails
                        ? Column(
                            children: [
                              SizedBox(
                                  height: 45,
                                  child: fielddecoration(
                                    labelText: 'Bank Name',
                                  )),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Account Number',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'IFSC Code',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Branch Name',
                                ),
                              ),
                              heigh10,
                              SizedBox(
                                height: 45,
                                child: fielddecoration(
                                  labelText: 'Branch City/Town',
                                ),
                              ),
                              heigh10,
                            ],
                          )
                        : SizedBox()
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class fielddecoration extends StatelessWidget {
  String labelText;
  fielddecoration({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        // hintText: 'Name',
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(),
      ),
    );
  }
}
