import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constants.dart';
import '../../controller/ArchitectformController.dart';
import '../Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
import 'service_rate.dart';

class ArchitectOfficeDetails extends StatefulWidget {
  const ArchitectOfficeDetails({Key? key}) : super(key: key);

  @override
  State<ArchitectOfficeDetails> createState() => _ArchitectOfficeDetailsState();
}

class _ArchitectOfficeDetailsState extends State<ArchitectOfficeDetails> {
  String IdProof = 'Passport';
  String selectedState = 'Karnataka';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController regnProofController = TextEditingController();
  final TextEditingController googleTagController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController AdressController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();

  final getController = Get.put(ArchitectformController());

  final formKey = GlobalKey<FormState>();

  final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
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
                      style: TextStyle(fontSize: 16.sp, color: kblackcolor),
                    )),
              ),
              heigh10,
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter your Company/Office/Shop',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    heigh10,
                    Text('Name', style: normal14),
                    heigh10,
                    SizedBox(
                        child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Comapany Name';
                              }

                              return null;
                            },
                            decoration: customInputDecoration('Jackson John'))),
                    heigh10,
                    Text('Attach Regn. Proof', style: normal14),
                    heigh10,
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width / 1.3) -
                                20.w,
                            padding: EdgeInsets.only(left: 10.0.w),
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black12),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            child: DropdownButton(
                              // Initial Value
                              value: IdProof,
                              underline: const SizedBox(),
                              // Down Arrow Icon
                              icon: Padding(
                                padding: EdgeInsets.only(left: 120.w),
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                              // Array list of items
                              items: Iditems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  IdProof = newValue!;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w),
                            height: 48.w,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.22,

                            // padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black12),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.cloud_upload_outlined,
                                    color: Colors.blue, size: 25.sp),
                                Text(
                                  'Upload',
                                  style: TextStyle(
                                      fontSize: 8.0.sp, color: Colors.blue),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    heigh10,
                    Text('Google tag', style: normal14),
                    heigh10,
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width / 1.3) - 20,
                            child: TextFormField(
                                controller: googleTagController,
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return 'Please enter google tag';
                                //   }

                                //   return null;
                                // },
                                decoration:
                                    customInputDecoration('Enter google tag')),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w),
                            height: 48.w,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.22,

                            // padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black12),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.cloud_upload_outlined,
                                    color: Colors.blue, size: 25.sp),
                                Text(
                                  'Upload',
                                  style: TextStyle(
                                      fontSize: 8.0.sp, color: Colors.blue),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    heigh10,
                    Text('Office Email Id', style: normal14),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5.w),
                      child: TextFormField(
                          controller: emailIdController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Email';
                            }
                            if (!RegExp(
                                    r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: customInputDecoration(
                              'architect@epropertymall.com')),
                    ),
                    heigh10,
                    Text('Address', style: normal14),
                    heigh10,
                    SizedBox(
                      child: TextFormField(
                          controller: AdressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter google tag';
                            }

                            return null;
                          },
                          decoration: customInputDecoration(
                              'Enter house no & street name')),
                    ),
                    heigh10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Town', style: normal14),
                            heigh10,
                            Container(
                              width: screenwidth / 2 - 12.w,
                              child: TextFormField(
                                controller: townController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter google tag';
                                  }

                                  return null;
                                },
                                decoration:
                                    customInputDecoration('Enter town name'),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('PinCode', style: normal14),
                            heigh10,
                            Container(
                              width: screenwidth / 2 - 12.w,
                              child: TextFormField(
                                controller: pincodeController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Pincode';
                                  }
                                  if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                                    return 'Please enter a valid Pincode';
                                  }

                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                decoration:
                                    customInputDecoration('Enter Pincode name'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    heigh10,
                    Text('Select your State', style: normal14),
                    heigh10,
                    SizedBox(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black12),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: DropdownButton(
                          value: selectedState,
                          underline: const SizedBox(),
                          items: stateDropdown
                              .map((value) => DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            selectedState = value!;
                            setState(() {});
                          },
                          isExpanded: true,
                        ),
                      ),
                    ),
                    heigh10,
                    heigh20,
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 143,
                        height: 35,
                        // color: Color.fromARGB(1, 255, 90, 95),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 90, 95)),
                          ),
                          onPressed: () {
                            final form = formKey.currentState;

                            if (form!.validate()) {
                              form.save();
                              getController.addOfficeDetails(
                                  currentUserUid,
                                  nameController.text,
                                  regnProofController.text,
                                  googleTagController.text,
                                  emailIdController.text.trim(),
                                  AdressController.text,
                                  townController.text,
                                  pincodeController.text,
                                  selectedState);
                              Get.off(() => Architectbottomnavigationbar(
                                    selectedindex: 0,
                                  ));
                            }
                          },
                          child: Text('Next', style: normal14),
                        ),
                      ),
                    ),
                    heigh10,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
