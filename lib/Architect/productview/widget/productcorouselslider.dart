import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCarouselslider extends StatelessWidget {
  final DesignData;

  ProductCarouselslider({super.key, required this.DesignData});


  List imageList = [];
  List titleList = [];

  @override
  Widget build(BuildContext context) {
    List exteriorimageList = DesignData.exteriorImageList;

    // List exteriorTitleList = DesignData.exteriorImagetitleList;

    imageList.addAll(DesignData.exteriorImageList);
    titleList.addAll(DesignData.exteriorImagetitleList);

    imageList.addAll(DesignData.floorImageList);

    titleList.addAll(DesignData.floorImagetitleList);

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
        CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            height: 180.w,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 5.0.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
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


