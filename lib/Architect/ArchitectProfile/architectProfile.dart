import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../../controller/ProfileController.dart';
import '../../model/architectmodel.dart';
import '../Architectbottomnavigationbar/Architectbottomnavigationbar.dart';

class ArchitectProfile extends StatefulWidget {
  ArchitectProfile({
    super.key,
  });

  @override
  State<ArchitectProfile> createState() => _ArchitectProfileState();
}

class _ArchitectProfileState extends State<ArchitectProfile> {
  String gender = 'Select your gender';

  final List<String> selectgender = ['Select your gender', 'Male', 'Female'];

  final getcontroller = Get.put(ProfileController());

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController designationController = TextEditingController();

  TextEditingController adressController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("ArchitectData")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return SizedBox(
                    height: 19.w,
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                      child: SizedBox(
                    height: 19.w,
                  ));
                }

                final data = ArchitectsignupData.fromJson(snapshot.data!);
                gender = data.gender;

                // // log(data.ProfileDetails['firstName'].toString());
                // if (data.ProfileDetails['firstName'] != "") {
                //   firstNameController.text = data.ProfileDetails['firstName'];
                // }
                // if (data.ProfileDetails['lastName'] != "") {
                //   lastNameController.text = data.ProfileDetails['lastName'];
                // }
                // if (data.ProfileDetails['dateOfBirth'] != "") {
                //   dateOfBirthController.text =
                //       data.ProfileDetails['dateOfBirth'];
                // }
                // if (gender == 'Select your gender' && data.ProfileDetails['gender']!='') {
                //   gender = data.ProfileDetails['gender'];
                // }

                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: kblackcolor,
                            size: 25.sp,
                          ),
                          label: Text(
                            'Back',
                            style:
                                TextStyle(fontSize: 16.sp, color: kblackcolor),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0.w),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40.w,
                            child: Image.asset('asset/user.png'),
                          ),
                          heigh5,
                          Text(data.name, style: bold16),
                          Text(
                            data.email,
                            style: normal14,
                          ),
                          heigh20,
                          TextField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                                hintText: data.name == ''
                                    ? 'Whats Your Name'
                                    : data.name),
                          ),
                          heigh20,
                          TextField(
                            controller: designationController,
                            decoration: InputDecoration(
                                hintText: data.designation == ''
                                    ? 'Whats Your designation'
                                    : data.designation),
                          ),
                          heigh20,
                          TextField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                                hintText: data.mobilenumber == ''
                                    ? 'Phone Number'
                                    : data.mobilenumber),
                          ),
                          heigh20,

                          // SizedBox(
                          //   height: 40.w,
                          //   child: DropdownButton(
                          //     value: gender,
                          //     underline: Container(
                          //       height: 1.w,
                          //       color: kgreycolor,
                          //     ),
                          //     items: selectgender
                          //         .map((value) => DropdownMenuItem(
                          //               child: Text(value),
                          //               value: value,
                          //             ))
                          //         .toList(),
                          //     onChanged: (value) {
                          //       gender = value!;
                          //       setState(() {});
                          //     },
                          //     isExpanded: true,
                          //   ),
                          // ),

                          heigh20,
                          TextField(
                            readOnly: true,
                            controller: adressController,
                            decoration: InputDecoration(
                                hintText: data.personalDetails['adress'] == ''
                                    ? 'Phone Number'
                                    : data.personalDetails['adress']),
                          ),
                          heigh20,
                          heigh20,
                          heigh20,
                          heigh20,
                          GestureDetector(
                            onTap: () => showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  titlePadding: EdgeInsets.all(0.w),
                                  title: Container(
                                    height: 114.w,
                                    width: 282.w,
                                    child: Column(
                                      children: [
                                        Container(
                                            alignment: Alignment.center,
                                            height: 84.w,
                                            child: Text(
                                              'Are you sure you want to Submit?',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: kblackcolor,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Spacer(),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                await getcontroller
                                                    .UpdatearchitectData(
                                                        currentUserUid,
                                                        firstNameController
                                                                    .text ==
                                                                ''
                                                            ? data.name
                                                            : firstNameController
                                                                .text,
                                                        phoneNumberController
                                                                    .text ==
                                                                ''
                                                            ? data.mobilenumber
                                                            : phoneNumberController
                                                                .text,
                                                        designationController
                                                                    .text ==
                                                                ''
                                                            ? data.designation
                                                            : designationController
                                                                .text,
                                                        gender);
                                                Get.to(() =>
                                                    Architectbottomnavigationbar(
                                                        selectedindex: 3));
                                              },
                                              child: Container(
                                                height: 30.w,
                                                width: 141.w,
                                                decoration: BoxDecoration(
                                                    color: kprimarycolor),
                                                child: Center(
                                                    child: Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: kwhitecolor),
                                                )),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => Get.back(),
                                              child: Container(
                                                height: 30.w,
                                                width: 141.w,
                                                decoration: BoxDecoration(
                                                    color: kwhitecolor,
                                                    border: Border.all(
                                                        color: kprimarycolor)),
                                                child: Center(
                                                    child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: kprimarycolor),
                                                )),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: screenWidth,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w),
                                  color: kprimarycolor),
                              child: Text(
                                'Update',
                                style: TextStyle(
                                    fontSize: 17.sp, color: kwhitecolor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
