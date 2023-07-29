import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Constants/constants.dart';
import '../../../../controller/upload design/ArchitectAddDesignController.dart';
import '../../../../model/uploadDesignDataModel.dart';
import '../../../ArchitectForm/ArchitectUploadDesign/Widgets/ArchitectaddWorkingDeatails.dart';

class EditMyDesign extends StatelessWidget {
  EditMyDesign({Key? key, required this.designData}) : super(key: key);
  designDataModel designData;
  final getxcontroller = Get.put(ArchitectAddDesignController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        Center(
          child: Text(
            'Delete Working Drawings',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: kprimarycolor,
            ),
          ),
        ),
        heigh5,
        ListView.separated(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    color: kprimarycolor.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 200.w,
                            child: Text(
                              designData.planingFiles[index]['name'],
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: kprimarycolor),
                            )),
                        Text(
                          'Rs. ${designData.planingFiles[index]['price']}',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              color: kbluecolor),
                        ),
                        GestureDetector(
                          onTap: () {
                            cofirmationPopup(
                              context,
                              designData.planingFiles[index],
                            );
                          },
                          child: const Icon(Icons.delete),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10.w,
            );
          },
          itemCount: designData.planingFiles.length,
        ),
        heigh10,
        ArchitectaddWorkingDeatails(),
        GestureDetector(
          onTap: () async {
            List planingImageUrl = [];
            for (var element in getxcontroller.planingImageUrl) {
              if (element != null) {
                planingImageUrl.add(element);
              }
            }
            if (planingImageUrl.length != getxcontroller.planningGridCount || planingImageUrl.isEmpty) {
              Fluttertoast.showToast(msg: 'Please upload files');
              return;
            }
            List planingFileNameList = [];
            getxcontroller.planingFileNameControllerList.forEach((element) {
              if (element.text.isNotEmpty) {
                planingFileNameList.add(element.text);
              }
            });

            if(planingFileNameList.length != getxcontroller.planningGridCount|| planingFileNameList.isEmpty){
              Fluttertoast.showToast(msg: 'Please add drawing name');
              return;
            }
            List planingFilePriceList = [];
            getxcontroller.planingFilePriceControllerList.forEach((element) {
              if (element.text.isNotEmpty) {
                planingFilePriceList.add(element.text);
              }
            });

            if(planingFilePriceList.length != getxcontroller.planningGridCount|| planingFilePriceList.isEmpty){
              Fluttertoast.showToast(msg: 'Please add price');
              return;
            }

            List planingFiles = [];
            for (int i = 0; i < planingImageUrl.length; i++) {
              planingFiles.add({
                'name': planingFileNameList[i],
                'price': planingFilePriceList[i],
                'url': planingImageUrl[i]
              });
            }
            print('no error');
            final collectionReference = FirebaseFirestore.instance
                .collection('DesignDataFromAdmin');
            await collectionReference.doc(designData.uid).update({
              'planingFiles': FieldValue.arrayUnion(planingFiles),
            });
            planingFileNameList.clear();
            planingFilePriceList.clear();
            planingImageUrl.clear();
            getxcontroller.clearingfields();

            Fluttertoast.showToast(msg: 'Files Uploaded Successfully');
            Get.back();
          },
          child: Container(
            height: 40.w,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.redAccent),
            child: Center(
              child: Text(
                "Upload Drawings",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        heigh20,
        heigh20,
      ],
    );
  }

  Future<void> cofirmationPopup(context, file) {
    print(designData.uid);
    return showDialog<void>(
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
                    'Are you sure you want to Delete?',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: kblackcolor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final collectionReference = FirebaseFirestore.instance
                            .collection('DesignDataFromAdmin');
                        designData.planingFiles.remove(file);
                        // Update the document with the modified array
                        await collectionReference.doc(designData.uid).update({
                          'planingFiles': FieldValue.arrayRemove([file]),
                        });
                        print('Deleted Successfully');
                        Get.back();
                      },
                      child: Container(
                        height: 30.w,
                        width: 141.w,
                        decoration: BoxDecoration(color: kprimarycolor),
                        child: Center(
                            child: Text(
                          'Yes',
                          style: TextStyle(fontSize: 13.sp, color: kwhitecolor),
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
                            border: Border.all(color: kprimarycolor)),
                        child: Center(
                            child: Text(
                          'Cancel',
                          style:
                              TextStyle(fontSize: 13.sp, color: kprimarycolor),
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
    );
  }
}
