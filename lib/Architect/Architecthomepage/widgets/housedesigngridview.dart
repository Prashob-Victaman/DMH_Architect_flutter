import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../../Constants/constants.dart';
import '../../../controller/HomepageController.dart';
import 'houseDesignInnerPage.dart';

class housedesigngridview extends StatelessWidget {
  housedesigngridview({
    super.key,
  });

  int count = 1;
  List itemList = [
    'Simplex',
    'Duplex',
    'Triplex',
    'Bungalow',
    'LodgeHotel',
    'Apartment',
    'ShopingMall',
    'SchoolCollege',
    'Hospital',
    'Hotel',
    'Restarent',
    'BanquetHall'
  ];

  // List<dynamic> SimplexList = [];

  final getcontroller = Get.put(HomePageContoller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0.w),
      child: FutureBuilder(
          future: getcontroller.getseparatedData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return SizedBox(
                height: 200.w,
                child: const Center(
                    child: CircularProgressIndicator(
                      color: kprimarycolor,
                    )),
              );
            }
            if (!snapshot.hasData) {
              return SizedBox(
                height: 200.w,
                child: const Center(
                    child: CircularProgressIndicator(
                      color: kprimarycolor,
                    )),
              );
            }

            final separatedData = snapshot.data as Map;

            return GridView.count(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1.2,
              crossAxisCount: 3,
              children: List.generate(12, (index) {
                return GestureDetector(
                  onTap: () => Get.to(() => houseDesignInnerPage(
                    CategoryData: separatedData[itemList[index]] ?? [],
                    title: housedesignname[index],
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 75,
                        width: 115.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(housedesignimages[index])),
                          color: kgreycolor,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                      ),
                      Text(
                        housedesignname[index],
                        style: normal14,
                      )
                    ],
                  ),
                );
              }),
            );
          }),
    );
  }
}
