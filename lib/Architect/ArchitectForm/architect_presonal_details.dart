import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dmh_architect/controller/architectDataController.dart';
import 'package:dmh_architect/model/architectmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../Constants/constants.dart';
import '../../controller/ArchitectformController.dart';
import 'architect_office_details.dart';

class ArchitectPresonalDetails extends StatefulWidget {
  const ArchitectPresonalDetails({Key? key}) : super(key: key);

  @override
  State<ArchitectPresonalDetails> createState() =>
      _ArchitectPresonalDetailsState();
}

class _ArchitectPresonalDetailsState extends State<ArchitectPresonalDetails> {
  String? _role = 'engineer';
  String IdProof = 'Passport';
  String selectedState = 'Andhra Pradesh';

  // List of items in our  dropdown menu

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsAppNumController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final getController = Get.put(ArchitectformController());

  final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  // final dataController = Get.put(ArchitectDataController());

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    // print(dataController.email);

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
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

              final data = ArchitectsignupData.fromJson(snapshot.data);

              phoneController.text = data.mobilenumber;
              emailController.text = data.email;
              fullnameController.text = data.name;

              return ListView(
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
                  Row(
                    children: [
                      Radio(
                        value: 'engineer',
                        groupValue: _role,
                        onChanged: (value) {
                          setState(() {
                            _role = value;
                          });
                        },
                      ),
                      Text(
                        'Engineer',
                        style: bold16,
                      ),
                      Radio(
                        value: 'architect',
                        groupValue: _role,
                        onChanged: (value) {
                          setState(() {
                            _role = value;
                          });
                        },
                      ),
                      Text('Architect/Designer', style: bold16),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Enter your personal details',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          heigh10,
                          Text(
                            'Full name',
                            style: normal14,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.w),
                            child: TextFormField(
                              // initialValue: dataController.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Name';
                                }
                                return null;
                              },
                              controller: fullnameController,
                              decoration: customInputDecoration('Jackson John'),
                            ),
                          ),
                          heigh10,
                          Text('Attach ID Proof', style: normal14),
                          heigh10,
                          SizedBox(
                            height: 45.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0.w),
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  // decoration: customBoxDecoration(),
                                  decoration: customBoxDecoration_two(),
                                  child: DropdownButton(
                                    // Initial Value
                                    value: IdProof,
                                    underline: const SizedBox(),
                                    // Down Arrow Icon
                                    //icon: Icon(Icons.keyboard_arrow_down),
                                    // Array list of items
                                    items: Iditems.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        IdProof = newValue!;
                                      });
                                    },
                                    isExpanded: true,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => getController.fetchIdProofImg(),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.22,

                                    // padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black12),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.cloud_upload_outlined,
                                            color: Colors.blue, size: 25.sp),
                                        Text(
                                          'Upload',
                                          style: TextStyle(
                                              fontSize: 8.0.sp,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          heigh10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mobile No',
                                    style: normal14,
                                  ),
                                  heigh10,
                                  SizedBox(
                                    height: 45.w,
                                    width: (MediaQuery.of(context).size.width /
                                            2) -
                                        10.w,
                                    child: TextFormField(
                                      // initialValue: dataController.number,
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter mobile No';
                                        }
                                        if (!RegExp(r'^\d{10}$')
                                            .hasMatch(value)) {
                                          return 'Please enter a valid mobile number';
                                        }

                                        return null;
                                      },
                                      cursorColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      controller: phoneController,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      keyboardType: TextInputType.phone,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        hintText: "Mobile No",
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: Colors.grey.shade600,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                          borderSide: const BorderSide(
                                              color: Colors.black12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                          borderSide: const BorderSide(
                                              color: Colors.black12),
                                        ),
                                        prefixIcon: Container(
                                          padding: EdgeInsets.all(10.0.w),
                                          child: InkWell(
                                            onTap: () {
                                              showCountryPicker(
                                                  context: context,
                                                  countryListTheme:
                                                      const CountryListThemeData(
                                                    bottomSheetHeight: 550,
                                                  ),
                                                  onSelect: (value) {
                                                    setState(() {
                                                      selectedCountryph = value;
                                                    });
                                                  });
                                            },
                                            child: Text(
                                              "${selectedCountryph.flagEmoji} + ${selectedCountryph.phoneCode}",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        //
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child:
                                          Text('WhatsApp no', style: normal14)),
                                  heigh10,
                                  SizedBox(
                                    height: 45.w,
                                    width: (MediaQuery.of(context).size.width /
                                            2) -
                                        10.w,
                                    child: TextFormField(
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter mobile No';
                                        }
                                        if (!RegExp(r'^\d{10}$')
                                            .hasMatch(value)) {
                                          return 'Please enter a valid mobile number';
                                        }

                                        return null;
                                      },
                                      cursorColor: Colors.purple,
                                      controller: whatsAppNumController,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      keyboardType: TextInputType.phone,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        hintText: "WhatsApp No",
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: Colors.grey.shade600,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                          borderSide: const BorderSide(
                                              color: Colors.black12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                          borderSide: const BorderSide(
                                              color: Colors.black12),
                                        ),
                                        prefixIcon: Container(
                                          padding: EdgeInsets.all(12.0.sp),
                                          child: InkWell(
                                            onTap: () {
                                              showCountryPicker(
                                                  context: context,
                                                  countryListTheme:
                                                      const CountryListThemeData(
                                                    bottomSheetHeight: 550,
                                                  ),
                                                  onSelect: (value) {
                                                    setState(() {
                                                      selectedCountrywh = value;
                                                    });
                                                  });
                                            },
                                            child: Text(
                                              "${selectedCountrywh.flagEmoji} + ${selectedCountrywh.phoneCode}",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          heigh10,
                          Text(
                            'Email id',
                            style: normal14,
                          ),
                          // heigh10,
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.w),
                            child: TextFormField(
                                // initialValue: dataController.email,
                                keyboardType: TextInputType.emailAddress,
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
                                controller: emailController,
                                decoration: customInputDecoration(
                                    'architect@epropertymall.com')),
                          ),
                          Text('Address', style: normal14),
                          heigh10,
                          SizedBox(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Address';
                                }

                                return null;
                              },
                              controller: adressController,
                              decoration: customInputDecoration(
                                  'Enter house no & street name'),
                            ),
                          ),
                          heigh10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Town', style: normal14),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.w),
                                    width: screenwidth / 2 - 15.w,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Town';
                                        }

                                        return null;
                                      },
                                      controller: townController,
                                      decoration: customInputDecoration(
                                          'Enter town name'),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('PinCode', style: normal14),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.w),
                                    width: screenwidth / 2 - 15.w,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Pincode';
                                        }
                                        if (!RegExp(r'^\d{6}$')
                                            .hasMatch(value)) {
                                          return 'Please enter a valid Pincode';
                                        }

                                        return null;
                                      },
                                      controller: pincodeController,
                                      keyboardType: TextInputType.phone,
                                      decoration: customInputDecoration(
                                          'Enter Pincode'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text('Select your State', style: normal14),
                          heigh10,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black12),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            child: DropdownButton(
                              underline: const SizedBox(),
                              items: stateDropdown
                                  .map((value) => DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedState = value!;
                                });
                              },
                              isExpanded: true,
                              value: selectedState,
                            ),
                          ),
                          heigh10,
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 143,
                              height: 35,
                              // color: Color.fromARGB(1, 255, 90, 95),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 255, 90, 95)),
                                ),
                                onPressed: () {
                                  final form = formKey.currentState;
                                  if (form!.validate()) {
                                    form.save();

                                    if (getController.idProofimg != null) {
                                      // print(
                                      //     '+${selectedCountryph.phoneCode}${phoneController.text}');
                                      getController.addPersonalDetails(
                                        currentUserUid,
                                        _role!,
                                        fullnameController.text,
                                        '+${selectedCountryph.phoneCode}${phoneController.text}',
                                        '+${selectedCountryph.phoneCode}${whatsAppNumController.text}',
                                        IdProof,
                                        emailController.text,
                                        adressController.text,
                                        townController.text,
                                        pincodeController.text,
                                        selectedState,
                                      );

                                      Get.to(() => ArchitectOfficeDetails());
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: 'Please Attach Id Proof');
                                    }
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
                  ),
                ],
              );
            }),
      ),
    );
  }
}
