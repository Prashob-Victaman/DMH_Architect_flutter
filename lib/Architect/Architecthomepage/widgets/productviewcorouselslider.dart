import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class productviewcorouselslider extends StatelessWidget {
  final  DesignData;
  int index;

  productviewcorouselslider({super.key, required this.DesignData, required this.index});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                image: DecorationImage(
                    image: NetworkImage(DesignData[index]['imageOneurl']),
                    fit: BoxFit.cover)),
            height: 160.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                image: DecorationImage(
                    image: NetworkImage(DesignData[index]['imageTwourl']),
                    fit: BoxFit.cover)),
            height: 160.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            height: 160.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                image: DecorationImage(
                    image: NetworkImage(DesignData[index]['imageThreeurl']),
                    fit: BoxFit.cover)),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        pageSnapping: true,
        height: 160.0.w,
        enlargeCenterPage: false,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1,
      ),
    );
  }
}
