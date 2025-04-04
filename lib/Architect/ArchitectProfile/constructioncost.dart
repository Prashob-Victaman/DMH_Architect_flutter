import 'package:dmh_architect/Constants/constants.dart';
import 'package:dmh_architect/controller/constuctioncostcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constructioncost extends StatelessWidget {
  Constructioncost({super.key});
  final CostCalculatorController controller =
      Get.put(CostCalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        backgroundColor: kwhitecolor,
          title: Text(
        "Construction Cost Calculator",
        style: normal18,
        
      )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: kblackcolor
                      .withOpacity(0.05), // Shadow color with opacity
                  blurRadius: 4.0, // Softness of the shadow
                  spreadRadius: 1, // How much the shadow spreads
                  offset:
                      Offset(0, 0), // Shadow position (horizontal, vertical)
                ),
              ], borderRadius: BorderRadius.circular(10), color: kwhitecolor),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kgreycolor.withOpacity(0.4))),
                    child: TextField(
                      decoration: textdecoration("Built-up Area (sq. ft)"),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.builtUpArea.value =
                            double.tryParse(value) ?? 0.0;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kgreycolor.withOpacity(0.4))),
                    child: TextField(
                      decoration: textdecoration("Approx Cost per sq. ft"),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.costPerSqFt.value =
                            double.tryParse(value) ?? 0.0;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: kashcolor,
                        foregroundColor: kprimarycolor),
                    onPressed: controller.calculateTotalCost,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      child: Text("Calculate"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
                "Total Cost: Rs. ${controller.totalCost.value.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            SizedBox(height: 20),
            Obx(
              () => Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: kblackcolor
                        .withOpacity(0.05), // Shadow color with opacity
                    blurRadius: 4.0, // Softness of the shadow
                    spreadRadius: 1, // How much the shadow spreads
                    offset:
                        Offset(0, 0), // Shadow position (horizontal, vertical)
                  ),
                ], borderRadius: BorderRadius.circular(10), color: kwhitecolor),
                child: Column(
                  children: [
                    ...controller.getCostBreakdown().entries.map((entry) {
                      return ListTile(
                        title: Text(entry.key, style: normal14),
                        trailing: Text("Rs. ${entry.value.toStringAsFixed(2)}",
                            style: normal14),
                      );
                    }).toList(),
                    Divider(),
                    Text("Material Quantities",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    ...controller.getMaterialQuantities().entries.map((entry) {
                      return ListTile(
                        title: Text(
                          entry.key,
                          style: normal14,
                        ),
                        trailing: Text(entry.value, style: normal14),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static InputDecoration textdecoration(hintText) {
    return InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13.0,
          // horizontal: 17.0,
        ),
        labelStyle: TextStyle(fontSize: 11, color: kprimarycolor),
        errorStyle: const TextStyle(fontSize: 0, color: kprimarycolor),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: kgreycolor.withOpacity(0.8)));
  }
}
