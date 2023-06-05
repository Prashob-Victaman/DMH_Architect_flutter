import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class productviewcorouselslider extends StatelessWidget {
  final  DesignData;
  int index;

  productviewcorouselslider({super.key, required this.DesignData, required this.index});


  List imageList = [];
  List titleList = [];

  @override
  Widget build(BuildContext context) {
    List exteriorimageList = DesignData[index]['exteriorImageList'];

    // List exteriorTitleList = DesignData.exteriorImagetitleList;

    imageList.addAll(DesignData[index]['exteriorImageList']);
    titleList.addAll(DesignData[index]['exteriorImagetitleList']);

    imageList.addAll(DesignData[index]['floorImageList']);

    titleList.addAll(DesignData[index]['floorImagetitleList']);

    print(
        '${exteriorimageList.length} exteriorimageList ${imageList.length} imageleist');

    return Center(
      child: CarouselSlider.builder(
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final image = imageList[index];
          final text = titleList[index];
          return buildCarouselItem(image, text);
        },
        options: CarouselOptions(
          height: 205.0.w,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          viewportFraction: 0.8,
        ),
      ),
    );
  }

  Widget buildCarouselItem(String image, String text) {
    return Column(
      children: [
        Container(
          height: 180.w,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.w),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16.0.sp, color: Colors.black),
        ),
      ],
    );
  }
}
