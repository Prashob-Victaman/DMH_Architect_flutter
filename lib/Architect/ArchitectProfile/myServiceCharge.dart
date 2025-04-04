import 'package:dmh_architect/Constants/constants.dart';
import 'package:flutter/material.dart';

class Myservicecharge extends StatelessWidget {
  Myservicecharge({super.key});

  List serviceList = [
    '2D Floor Plan',
    '3D Floor Plan',
    'Structural Plan',
    '3D Exterior',
    'Electrical Plan',
    'Plumbing Plan',
    'Exterior Video',
    'Interior Video'
  ];

  List serviceListImg = [
    'asset/serviceImage/2D Floor Plan.png',
    'asset/serviceImage/3D Exterior.png',
    'asset/serviceImage/Structural Plan.png',
    'asset/serviceImage/3D Exterior.png',
    'asset/serviceImage/Electricals Plan.png',
    'asset/serviceImage/Plumbing Plan.png',
    'asset/serviceImage/Walkthrough(Exterior).png',
    'asset/serviceImage/Walkthrough(Interior).png'
  ];

  List siteVisitServiceList = ['Site Supervision', 'Layout At Site'];

  List siteVisitServiceListImg = [
    'asset/serviceImage/Supervision.png',
    'asset/serviceImage/Layout.png',
  ];

  @override
  Widget build(BuildContext context) {
    //edit button
    return Scaffold(
      backgroundColor: kashcolor,
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        foregroundColor: kwhitecolor,
        title: Title(
            color: kwhitecolor,
            child: Text(
              'My Service Charges',
              style: TextStyle(
                  fontSize: 16,
                  color: kwhitecolor,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            heigh5,
            Container(
              // height: 25,
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 3),
              color: kredcolor,
              child: Text(
                'House Designing Charges',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kwhitecolor),
              ),
            ),
            heigh5,

            // heigh10,
            // Padding(
            //   padding: EdgeInsets.only(left: 8.0),
            //   child: Text('House Designing Charges'),
            // ),
            // heigh5,
            GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.63,
              children: List.generate(
                serviceList.length,
                (index) => boxWidget(
                    index: index,
                    title: serviceList[index],
                    img: serviceListImg[index]),
              ),
            ),
            heigh10,
            Container(
              // height: 25,
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 3),
              color: kredcolor,
              child: Text(
                'Site Visit Charges',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kwhitecolor),
              ),
            ),
            heigh10,
            GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8,
              children: List.generate(
                2,
                (index) => boxWidget(
                    index: index,
                    title: siteVisitServiceList[index],
                    img: siteVisitServiceListImg[index]),
              ),
            ),
            heigh20
          ],
        ),
      ),
    );
  }
}

class boxWidget extends StatelessWidget {
  int index;
  String title;
  String img;
  boxWidget(
      {super.key, required this.index, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kwhitecolor),
      child: Column(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: kprimarycolor),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kblackcolor),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: kwhitecolor, fontSize: 15),
                  ),
                ),
                width5,
                Text(
                  title,
                  style: TextStyle(color: kwhitecolor, fontSize: 13),
                ),
                Spacer(),
                Icon(
                  Icons.more_vert,
                  size: 18,
                ),
                width5
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(15)),
                color: kgreycolor,
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
              ),
            ),
          ),
          // heigh5,
          Container(
            padding: EdgeInsets.symmetric(vertical: 1),
            alignment: Alignment.center,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
                color: Colors.green.withOpacity(0.6),
              )
            ]),
            child: Container(
              // color: kwhitecolor,
              margin: EdgeInsets.symmetric(vertical: 1, horizontal: 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kwhitecolor,
                  border: Border.all(
                      color: Colors.green.withOpacity(0.8), width: 1)),
              child: Column(
                children: [
                  Text(
                    'Rs 3/sqft',
                    style: TextStyle(
                        color: kbluecolor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Min. 3000',
                      style: TextStyle(
                          color: kbluecolor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),

          Container(
            // height: 20,
            child: Column(
              children: [
                heigh5,
                Text(
                  'Download Files',
                  style: normal15,
                ),
                heigh5,
                SizedBox(
                  height: 23,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kashcolor),
                          width: 23,
                          child: Text(
                            '${index + 1}',
                            style: normal15,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return width5;
                      },
                      itemCount: 4),
                ),
                heigh5,
                Text(
                  'Changes upto 4 times',
                  style: normal14,
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Deliver in 6 working days',
                  style: normal12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
