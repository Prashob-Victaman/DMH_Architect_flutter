import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constants.dart';

class FloorDetails extends StatefulWidget {
  const FloorDetails({super.key});

  @override
  State<FloorDetails> createState() => _FloorDetailsState();
}

class _FloorDetailsState extends State<FloorDetails> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    String selectedFloor = 'Basement';

    final List<String> _floorDropdown = [
      "Basement",
    ];
    return Container(
      child: Container(
        decoration: customBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 300.sp,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: customBoxDecoration(),
                    child: DropdownButton(
                      value: selectedFloor,
                      underline: const SizedBox(),
                      items: _floorDropdown
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        selectedFloor = value!;
                        setState(() {});
                      },
                      isExpanded: true,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_box_rounded)),
                ],
              ),
              heigh10,
              Row(
                children: [
                  Container(
                    width: 145.sp,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: customBoxDecoration(),
                    child: DropdownButton(
                      value: selectedFloor,
                      underline: const SizedBox(),
                      items: _floorDropdown
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        selectedFloor = value!;
                        setState(() {});
                      },
                      isExpanded: true,
                    ),
                  ),
                  width10,
                  Container(
                    width: 145.sp,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: customBoxDecoration(),
                    child: DropdownButton(
                      value: selectedFloor,
                      underline: const SizedBox(),
                      items: _floorDropdown
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        selectedFloor = value!;
                        setState(() {});
                      },
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
              heigh10,
              Row(
                children: [
                  Container(
                    width: 145.sp,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: customBoxDecoration(),
                    child: DropdownButton(
                      value: selectedFloor,
                      underline: const SizedBox(),
                      items: _floorDropdown
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        selectedFloor = value!;
                        setState(() {});
                      },
                      isExpanded: true,
                    ),
                  ),
                  width10,
                  Container(
                    width: 145.sp,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: customBoxDecoration(),
                    child: DropdownButton(
                      value: selectedFloor,
                      underline: const SizedBox(),
                      items: _floorDropdown
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        selectedFloor = value!;
                        setState(() {});
                      },
                      isExpanded: true,
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.add_box_rounded))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
