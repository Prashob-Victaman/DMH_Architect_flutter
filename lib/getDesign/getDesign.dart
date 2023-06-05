import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../Constants/constants.dart';
import '../../controller/CustomDesignController.dart';

class GetDesign extends StatefulWidget {
  GetDesign({Key? key, required this.DesignData}) : super(key: key);
  final DesignData;

  @override
  State<GetDesign> createState() => _GetDesignState();
}

class _GetDesignState extends State<GetDesign> {
  int selectedRadio = 0;
  int selectedRadioTile = 0;
  double? price;
  var razorpay = Razorpay();


  List titledata = ['Floor Plan With Column', 'Foundation and structure Plan'];
  List subtitledata = [
    'Basement Plan',
    'Ground floor plan',
    'first floor plan'
  ];


  @override
  void initState() {


    super.initState();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }



  // void onPause() {
  //   unregisterReceiver(
  //       yourBroadcastReceiver); // Replace 'yourBroadcastReceiver' with the actual name of your receiver
  // }

  @override
  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    var userdata = await FirebaseFirestore.instance
        .collection('UserData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    // Do something when payment succeeds
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'paymentdetails': FieldValue.arrayUnion([
        {
          'orderId': 'DMH${DateTime.now().millisecondsSinceEpoch}',
          'dateTime': DateTime.now().toString(),
          'amount': 3,
          'razorpayId': 'response.signature',
        }
      ])
    });

    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'myDesigns': FieldValue.arrayUnion([
        {
          'uid': 'DMH${DateTime.now().millisecondsSinceEpoch}',
          'dateTime': DateTime.now(),
          'designName':
              '${widget.DesignData.houseType} ${widget.DesignData.designType}',
          'designUid': 'designUid',
          'imagUrlOne': widget.DesignData.imageOneurl,
          'imagUrlTwo': widget.DesignData.imageTwourl,
          'imagUrlThree': widget.DesignData.imageThreeurl,
        }
      ])
    });

    //await FirebaseFirestore.instance.collection('PurchasedDesign').doc().

    var number = userdata['ProfileDetails']['mobileNumber'];
    var userName = userdata['ProfileDetails']['firstName'] +
        ' ' +
        userdata['ProfileDetails']['lastName'];

    Get.put(CustomDesignController()).uploadCustomDesignData(
        FirebaseAuth.instance.currentUser!.uid,
        widget.DesignData.projectDetails,
        widget.DesignData.designType,
        widget.DesignData.houseFloors,
        widget.DesignData.houseType,
        widget.DesignData.houseArea,
        widget.DesignData.accordingtoVastu,
        number,
        userName,
        widget.DesignData.designprice,
        widget.DesignData.uploadedBy);

    var DocRef = FirebaseFirestore.instance.collection("PaymentDetails").doc(
        '${DateFormat('MMM').format(DateTime.now())}_${DateTime.now().year}');
    var doc = await DocRef.get();
    if (!doc.exists) {
      await DocRef.set({
        'payments': FieldValue.arrayUnion([
          {
            'name': '',
            'amount': price,
            'date': '',
            'transaction': '',
          }
        ])
      });
    } else {
      await DocRef.update({
        'payments': FieldValue.arrayUnion([
          {
            'name': 'aa',
            'amount': price,
            'date': Timestamp.now(),
            'transaction': response.paymentId,
          }
        ])
      });
    }
    //await Get.to(PaymentSuccess());
    // productUidList.clear();
  }

// log(response.signature.toString());

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: ListView(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: Row(children: [
                    Icon(
                      Icons.arrow_back,
                      size: 20.sp,
                    ),
                    Text(
                      'Back',
                      style: normal16,
                    )
                  ]),
                ),
              ),
              heigh10,
              Text(
                'Get Working drawings',
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: kprimarycolor),
              ),
              heigh10,
              ListView.separated(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          fillColor: MaterialStateProperty.all(kprimarycolor),
                          value: false,
                          onChanged: (value) {
                            value = true;
                          },
                        ),
                        Column(
                          children: [
                            Container(
                              width: 300.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.w)),
                                color: kprimarycolor.withOpacity(0.3),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          widget.DesignData.planingFileNameList[index],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: kprimarycolor),
                                        )),
                                    Text(
                                      'Rs. ${widget.DesignData.planingFilePriceList[index]
                                      }',
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                          color: kbluecolor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   width: 300.w,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.only(
                            //         bottomLeft: Radius.circular(10.w),
                            //         bottomRight: Radius.circular(10.w)),
                            //     color: kprimarycolor.withOpacity(0.1),
                            //   ),
                            //   child: Padding(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 8.0.w, vertical: 5.w),
                            //     child: ListView.separated(
                            //         shrinkWrap: true,
                            //         physics: ScrollPhysics(),
                            //         itemBuilder: (context, index) {
                            //           return Text(subtitledata[index]);
                            //         },
                            //         separatorBuilder: (context, index) {
                            //           return Divider(
                            //             height: 5.w,
                            //             thickness: 0.5.w,
                            //           );
                            //         },
                            //         itemCount: 3),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.w,
                    );
                  },
                  itemCount: widget.DesignData.planingFileNameList.length
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          price = double.parse(widget.DesignData.designprice);
          if (selectedRadioTile == 1) {
            price = (int.parse(widget.DesignData.designprice) +
                    int.parse(widget.DesignData.designprice) * 0.3)
                .toPrecision(1);
          } else if (selectedRadioTile == 2) {
            price = (int.parse(widget.DesignData.designprice) +
                    int.parse(widget.DesignData.designprice) * 0.5)
                .toPrecision(1);
          } else if (selectedRadioTile == 3) {
            price = (int.parse(widget.DesignData.designprice) +
                    int.parse(widget.DesignData.designprice) * 0.7)
                .toPrecision(1);
          }
          var userdata = await FirebaseFirestore.instance
              .collection('UserData')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();

          var options = {
            'key': 'rzp_test_HWbWOKuaXLdQ8I',
            'amount': price! * 100,
            'name': 'Design My House',
            'description': 'Design_My_House_Payments',
            'timeout': 300,
            'prefill': {
              'contact': userdata['ProfileDetails']['8714500637'],
              'email': userdata['email']
            }
          };
          razorpay.open(options);
        },
        child: Container(
          alignment: Alignment.center,
          width: (MediaQuery.of(context).size.width) / 1.1,
          height: 50.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
              color: kprimarycolor),
          child: Text(
            'Choose Architect',
            style: TextStyle(fontSize: 17.sp, color: kwhitecolor),
          ),
        ),
      ),
    );
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }
}
