import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

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
          return buildCarouselItem(image, text, context);
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

  Widget buildCarouselItem(String image, String text, context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print('object');
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return Scaffold(
                    backgroundColor: Colors.black,
                    body: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Hero(
                              tag: image,
                              child:
                                  PhotoView(imageProvider: NetworkImage(image)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20.w,
                          right: 20.w,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.close,
                              color: kwhitecolor,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
          child: CachedNetworkImage(
            placeholder: (context, url) => Image(
                height: 180.w,
                // width: screenwidth - 20.w,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                image: const AssetImage('asset/placeholder.png')),
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
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16.0.sp, color: Colors.black),
        ),
      ],
    );
  }
}
