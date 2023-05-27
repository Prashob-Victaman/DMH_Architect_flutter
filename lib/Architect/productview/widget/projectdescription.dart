import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../Constants/constants.dart';
import '../../../model/uploadDesignDataModel.dart';

class ProjectDescription extends StatelessWidget {
  final designDataModel DesignData;

  const ProjectDescription({super.key, required this.DesignData});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: [
          Text(
            'Project Description',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: kprimarycolor,
            ),
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: DesignData.designType,
            title: 'Design Type',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: DesignData.houseType,
            title: 'House Type',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: DesignData.houseFloors,
            title: 'House Floor',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${DesignData.houseArea['length']} In',
            title: 'House Length(Depth)',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${DesignData.houseArea['width']} In',
            title: 'House Width(Front)',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${DesignData.houseArea['area']} Sqft',
            title: 'Total House buildup area ',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '₹ ${DesignData.estimatedConstructionCost}.00',
            title: 'Estimated Construction Cost',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '₹ ${DesignData.aproximateConstructionCost}.00',
            title: 'Aproximate Construction Cost',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '₹ ${DesignData.designprice}.00',
            title: 'Design Price',
          ),
          // heigh5,
          // ProjectDescriptiontabs(
          //   screenwidth: screenwidth,
          //   subtitle: '2,123 Sqft.',
          //   title: 'Plot Area',
          // ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${DesignData.accordingtoVastu} %',
            title: 'According to Vastu',
          ),
          heigh5,
          // ProjectDescriptiontabs(
          //   screenwidth: screenwidth,
          //   subtitle: '4 Month - 6 Month',
          //   title: 'Estimate Time',
          // ),
     
          heigh10,
          // Container(
          //   decoration: BoxDecoration(),
          //   child: Column(
          //     children: [
          //       Container(
          //         padding: EdgeInsets.symmetric(horizontal: 10.w),
          //         alignment: Alignment.centerLeft,
          //         height: 40.w,
          //         width: screenwidth - 20,
          //         decoration: BoxDecoration(
          //             color:
          //                 Color.fromARGB(255, 253, 173, 176).withOpacity(0.5),
          //             borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(10.w),
          //                 topRight: Radius.circular(10.w))),
          //         child: Text(
          //           'First Floor',
          //           style: TextStyle(
          //               fontSize: 17.w,
          //               fontWeight: FontWeight.bold,
          //               color: kprimarycolor),
          //         ),
          //       ),
          //       Container(
          //         padding: EdgeInsets.all(10.w),
          //         decoration: BoxDecoration(
          //             borderRadius:
          //                 BorderRadius.vertical(bottom: Radius.circular(10.w)),
          //             color:
          //                 Color.fromARGB(255, 253, 173, 176).withOpacity(0.2)),
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Container(
          //                   height: 15.w,
          //                   width: 15.w,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(15.w),
          //                       border: Border.all(color: kprimarycolor)),
          //                 ),
          //                 width10,
          //                 Text('2 BHK Flat', style: normal16)
          //               ],
          //             ),
          //             heigh10,
          //             Row(
          //               children: [
          //                 Container(
          //                   height: 15.w,
          //                   width: 15.w,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(15.w),
          //                       border: Border.all(color: kprimarycolor)),
          //                 ),
          //                 width10,
          //                 Text('3 BHK Flat', style: normal16)
          //               ],
          //             ),
          //             heigh10,
          //             Row(
          //               children: [
          //                 Container(
          //                   height: 15.w,
          //                   width: 15.w,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(15.w),
          //                       border: Border.all(color: kprimarycolor)),
          //                 ),
          //                 width10,
          //                 Text('1 Stairs', style: normal16)
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //       heigh20
          //     ],
          //   ),
          // ),
          //   Container(
          //     decoration: BoxDecoration(),
          //     child: Column(
          //       children: [
          //         Container(
          //           padding: EdgeInsets.symmetric(horizontal: 10.w),
          //           alignment: Alignment.centerLeft,
          //           height: 40.w,
          //           width: screenwidth - 20,
          //           decoration: BoxDecoration(
          //               color:
          //                   Color.fromARGB(255, 253, 173, 176).withOpacity(0.5),
          //               borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(10.w),
          //                   topRight: Radius.circular(10.w))),
          //           child: Text(
          //             'First Floor',
          //             style: TextStyle(
          //                 fontSize: 17.w,
          //                 fontWeight: FontWeight.bold,
          //                 color: kprimarycolor),
          //           ),
          //         ),
          //         Container(
          //           padding: EdgeInsets.all(10.w),
          //           decoration: BoxDecoration(
          //               borderRadius:
          //                   BorderRadius.vertical(bottom: Radius.circular(10.w)),
          //               color:
          //                   Color.fromARGB(255, 253, 173, 176).withOpacity(0.2)),
          //           child: Column(
          //             children: [
          //               Row(
          //                 children: [
          //                   Container(
          //                     height: 15.w,
          //                     width: 15.w,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(15.w),
          //                         border: Border.all(color: kprimarycolor)),
          //                   ),
          //                   width10,
          //                   Text('2 BHK Flat', style: normal16)
          //                 ],
          //               ),
          //               heigh10,
          //               Row(
          //                 children: [
          //                   Container(
          //                     height: 15.w,
          //                     width: 15.w,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(15.w),
          //                         border: Border.all(color: kprimarycolor)),
          //                   ),
          //                   width10,
          //                   Text('3 BHK Flat', style: normal16)
          //                 ],
          //               ),
          //               heigh10,
          //               Row(
          //                 children: [
          //                   Container(
          //                     height: 15.w,
          //                     width: 15.w,
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(15.w),
          //                         border: Border.all(color: kprimarycolor)),
          //                   ),
          //                   width10,
          //                   Text('1 Stairs', style: normal16)
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //         heigh20
          //       ],
          //     ),
          //   )
        ],
      ),
    );
  }
}

class ProjectDescriptiontabs extends StatelessWidget {
  final String title;
  final String subtitle;

  const ProjectDescriptiontabs(
      {super.key,
      required this.screenwidth,
      required this.title,
      required this.subtitle});

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: kashcolor,
      ),
      width: screenwidth - 10.w,
      height: 30.w,
      child: Row(
        children: [
          Text(
            title,
            style: bold15,
          ),
          Spacer(),
          Text(
            subtitle,
            style: normal15,
          )
        ],
      ),
    );
  }
}
