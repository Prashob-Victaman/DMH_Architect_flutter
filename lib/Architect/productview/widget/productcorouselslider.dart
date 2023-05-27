import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCarouselslider extends StatelessWidget {
  final DesignData;

  ProductCarouselslider({super.key, required this.DesignData});

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
                    image: NetworkImage(DesignData.imageOneurl),
                    fit: BoxFit.cover)),
            height: 180.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                image: DecorationImage(
                    image: NetworkImage(DesignData.imageTwourl),
                    fit: BoxFit.cover)),
            height: 180.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            height: 180.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                image: DecorationImage(
                    image: NetworkImage(DesignData.imageThreeurl),
                    fit: BoxFit.cover)),
          ),
        ),
        DesignData.workingBasementimageOneurl != null
            ? Padding(
                padding: EdgeInsets.all(10.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      image: DecorationImage(
                          image: NetworkImage(
                              DesignData.workingBasementimageOneurl),
                          fit: BoxFit.cover)),
                  height: 180.w,
                ),
              )
            : Padding(
                padding: EdgeInsets.all(10.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      image: DecorationImage(
                          image: NetworkImage(DesignData.imageOneurl),
                          fit: BoxFit.cover)),
                  height: 180.w,
                ),
              ),
        DesignData.workinggroundimageTwourl != null
            ? Padding(
                padding: EdgeInsets.all(10.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      image: DecorationImage(
                          image:
                              NetworkImage(DesignData.workinggroundimageTwourl),
                          fit: BoxFit.cover)),
                  height: 180.w,
                ),
              )
            : Padding(
                padding: EdgeInsets.all(10.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      image: DecorationImage(
                          image: NetworkImage(DesignData.imageTwourl),
                          fit: BoxFit.cover)),
                  height: 180.w,
                ),
              ),
        DesignData.workinggroundimageTwourl != null
            ? Padding(
                padding: EdgeInsets.all(10.w),
                child: Container(
                  height: 180.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      image: DecorationImage(
                          image: NetworkImage(
                              DesignData.workingfirstimageThreeurl),
                          fit: BoxFit.cover)),
                ),
              )
            : Padding(
                padding: EdgeInsets.all(10.w),
                child: Container(
                  height: 180.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      image: DecorationImage(
                          image: NetworkImage(DesignData.imageThreeurl),
                          fit: BoxFit.cover)),
                ),
              ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        pageSnapping: true,
        height: 180.0.w,
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
