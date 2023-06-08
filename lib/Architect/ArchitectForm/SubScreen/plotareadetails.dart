import 'package:dmh_architect/controller/upload%20design/AreaController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constants/constants.dart';

class PlotAreaDetails extends StatelessWidget {
  final TextEditingController plotLengthController;
  final TextEditingController plotWidthController;
  var totalArea;
  PlotAreaDetails({
    required this.plotLengthController,
    required this.plotWidthController,
    required this.totalArea,
    super.key,
  });

  // final double screenWidth;
  final getAreaController = Get.put(AreaController());
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // print(screenWidth/3.5);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Plot Length',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            heigh5,
            SizedBox(
                width: 108.w,
                child: TextFormField(
                  controller: plotLengthController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter plot length';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: customInputDecoration('In feet'),
                  onChanged: (value) {
                    getAreaController.height = value;
                    getAreaController.calculatearea();
                  },
                ))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Plot Width',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            heigh5,
            SizedBox(
                width: 108.w,
                child: TextFormField(
                  controller: plotWidthController,
                  decoration: customInputDecoration('In Feet'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter plot Width';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    getAreaController.length = value;

                    getAreaController.calculatearea();
                    // print(getAreaController.area);
                  },
                ))
          ],
        ),
        GetBuilder<AreaController>(builder: (getdata) {
          totalArea = getdata.area;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Area',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              heigh10,
              Text('${getdata.area} Sqft')
            ],
          );
        })
      ],
    );
  }
}
