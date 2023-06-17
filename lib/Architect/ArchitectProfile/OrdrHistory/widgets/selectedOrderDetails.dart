import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedOrderDetails extends StatelessWidget {
  const SelectedOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
            ],
          ),
          Text(
            'Order ID : DMH4235243524354',
            style: bold16,
          )
        ],
      ),
    );
  }
}
