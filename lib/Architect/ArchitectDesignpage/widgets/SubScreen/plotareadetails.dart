import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constants/constants.dart';

class CustomPlotAreaDetails extends StatelessWidget {
  final TextEditingController plotLengthController;
  final TextEditingController plotWidthController;
  final TextEditingController totalAreaController;
  const CustomPlotAreaDetails({
    required this.plotLengthController,
    required this.plotWidthController,
    required this.totalAreaController,
    super.key,
  });

  // final double screenWidth;

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
                  decoration: customInputDecoration('24'),
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
                  decoration: customInputDecoration('24'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter plot Width';
                    }
                    return null;
                  },
                ))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Area',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            heigh5,
            SizedBox(
                width: 108.w,
                child: TextFormField(
                  controller: totalAreaController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter plot area';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: customInputDecoration('24'),
                ))
          ],
        )
      ],
    );
  }
}
