import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Constants/constants.dart';

class UploadDesignPartThree extends StatefulWidget {
  int selectedHouseFloor = 0;
  int selectedHouseFacing = 0;
  UploadDesignPartThree(
      {Key? key,
      required this.selectedHouseFacing,
      required this.selectedHouseFloor})
      : super(key: key);

  @override
  State<UploadDesignPartThree> createState() => _UploadDesignPartThreeState();
}

class _UploadDesignPartThreeState extends State<UploadDesignPartThree> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        heigh10,
        const Text(
          'House Floors',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 25.w,
                  child: Checkbox(
                    value: widget.selectedHouseFloor == 0 ? true : false,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedHouseFloor = 0;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Floor-1'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 25.w,
                  child: Checkbox(
                    value: widget.selectedHouseFloor == 1 ? true : false,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedHouseFloor = 1;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Floor-2'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 25.w,
                  child: Checkbox(
                    value: widget.selectedHouseFloor == 2 ? true : false,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedHouseFloor = 2;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text('Floor-3'),
                ),
              ],
            ),
          ],
        ),
        heigh10,
        const Text(
          'House Facing',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 25.w,
                  child: Checkbox(
                    value: widget.selectedHouseFacing == 0 ? true : false,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedHouseFacing = 0;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('East'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 25.w,
                  child: Checkbox(
                    value: widget.selectedHouseFacing == 1 ? true : false,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedHouseFacing = 1;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('West'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 25.w,
                  child: Checkbox(
                    value: widget.selectedHouseFacing == 2 ? true : false,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedHouseFacing = 2;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text('South'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 25.w,
                  child: Checkbox(
                    value: widget.selectedHouseFacing == 3 ? true : false,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedHouseFacing = 3;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text('Others'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
