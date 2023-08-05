import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmh_architect/model/floorDetailsfromjson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../Constants/constants.dart';

class HomepageProjectDescription extends StatelessWidget {
  final DesignData;
  final index;

  HomepageProjectDescription(
      {super.key, required this.DesignData, required this.index});

  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = DesignData[index]['postedDate'];
    DateTime dateTime = timestamp.toDate();

    String cdate = DateFormat("dd - MMM - yyyy").format(dateTime);

    final screenwidth = MediaQuery.of(context).size.width;

    var designDataList = DesignData[index]['floordetails'];

     double constructionCost =
        double.parse(DesignData[index]['aproximateConstructionCost']);

    var arrangedconstructionCost =
        NumberFormat("#,##,###.0#", "en_US").format(constructionCost);

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
            subtitle: DesignData[index]['designType'],
            title: 'Design Type',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: DesignData[index]['houseType'],
            title: 'House Type',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: DesignData[index]['houseFloors'],
            title: 'House Floor',
          ),

          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${DesignData[index]['houseArea']['length']} Ft',
            title: 'House Length(Depth)',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${DesignData[index]['houseArea']['width']} Ft',
            title: 'House Width(Front)',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${DesignData[index]['houseArea']['area']} Sqft',
            title: 'Total House buildup area ',
          ),
          heigh5,

          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${DesignData[index]['estimatedConstructionCost']}',
            title: 'Estimated Construction Time',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${arrangedconstructionCost}0',
            title: 'Aproximate Construction Cost',
          ),
          // heigh5,
          // ProjectDescriptiontabs(
          //   screenwidth: screenwidth,
          //   subtitle: '${DesignData[index]['designprice']}.00',
          //   title: 'Design Price',
          // ),
          // heigh5,
          // ProjectDescriptiontabs(
          //   screenwidth: screenwidth,
          //   subtitle: 'Modern',
          //   title: 'Plot length',
          // ),
          // heigh5,
          // ProjectDescriptiontabs(
          //   screenwidth: screenwidth,
          //   subtitle: '2,123 Sqft.',
          //   title: 'Plot Area',
          // ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${DesignData[index]['accordingtoVastu']} %',
            title: 'According to Vastu',
          ),
          heigh5,
          ProjectDescriptiontabs(
            screenwidth: screenwidth,
            subtitle: '${cdate}',
            title: 'Posted Date',
          ),
          heigh10,

          Text(
            'Floor Description',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: kprimarycolor,
            ),
          ),
          heigh5,
          ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                var designDatfrommap =
                    FloorDeatails.fromJson(designDataList[index]);

                // print(designDatfrommap.floor);
                return Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        alignment: Alignment.centerLeft,
                        height: 40.w,
                        width: screenwidth - 20,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 253, 173, 176)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.w),
                                topRight: Radius.circular(10.w))),
                        child: Text(
                          '${designDatfrommap.datazero![0]}',
                          style: TextStyle(
                              fontSize: 17.w,
                              fontWeight: FontWeight.bold,
                              color: kprimarycolor),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10.w)),
                            color: const Color.fromARGB(255, 253, 173, 176)
                                .withOpacity(0.2)),
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 15.w,
                                        width: 15.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.w),
                                            border: Border.all(
                                                color: kprimarycolor)),
                                      ),
                                      width10,
                                      Text(
                                          '${designDatfrommap.dataone![index]} - ${designDatfrommap.datatwo![index]}',
                                          style: normal16)
                                    ],
                                  ),
                                  heigh10,
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.w,
                              );
                            },
                            itemCount: designDatfrommap.dataone!.length),
                      ),
                      heigh20
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: designDataList.length),
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
