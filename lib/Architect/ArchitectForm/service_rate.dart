// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../Constants/constants.dart';
// import '../Architectbottomnavigationbar/Architectbottomnavigationbar.dart';
// import 'upload_design.dart';

// class ServiceRate extends StatefulWidget {
//   const ServiceRate({Key? key}) : super(key: key);

//   @override
//   State<ServiceRate> createState() => _ServiceRateState();
// }

// class _ServiceRateState extends State<ServiceRate> {
//   String selectedState = 'Karnataka';
//   String serviceType = 'Planning';
//   List<String> serviceTypeList = ['Planning'];
//   final List<String> _serviceTypeDropdown = [
//     "Planning",
//     'Structure',
//     '2D Elevation'
//     '3D Elevation',
//     '3D Floor',
//     'Walkthrough Video(Exterior)',
//     'Walkthrough Video(Interior & Exterior)',
//     'Electricals',
//     'Plumbing',
//         'Site Supervision',

//   ];

//   int count = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: TextButton.icon(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.arrow_back),
//                   label: const Text('Back')),
//             ),
//             heigh20,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Service Rate',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.redAccent,
//                     shape: const StadiumBorder(),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       serviceTypeList.add('Planning');
//                       count += 1;
//                     });
//                   },
//                   child: Row(
//                     children: const [
//                       Text('Add'),
//                       Icon(Icons.add_box_rounded),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             heigh10,
//             ListView.separated(
//                 shrinkWrap: true,
//                 physics: ScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: customBoxDecoration(),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width - 18,
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 10.0),
//                             decoration: customBoxDecoration(),
//                             child: DropdownButton(
//                               value: serviceTypeList[index],
//                               underline: const SizedBox(),
//                               items: _serviceTypeDropdown
//                                   .map((value) => DropdownMenuItem(
//                                         value: value,
//                                         child: Text(value),
//                                       ))
//                                   .toList(),
//                               onChanged: (value) {
//                                 serviceTypeList[index] = value!;
//                                 setState(() {});
//                               },
//                               isExpanded: true,
//                             ),
//                           ),
//                           heigh10,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width / 2.5,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 decoration: customBoxDecoration(),
//                                 child: DropdownButton(
//                                   value: serviceTypeList[index],
//                                   underline: const SizedBox(),
//                                   items: _serviceTypeDropdown
//                                       .map((value) => DropdownMenuItem(
//                                             value: value,
//                                             child: Text(value),
//                                           ))
//                                       .toList(),
//                                   onChanged: (value) {
//                                     serviceTypeList[index] = value!;
//                                     setState(() {});
//                                   },
//                                   isExpanded: true,
//                                 ),
//                               ),
//                               Container(
//                                 width:
//                                     MediaQuery.of(context).size.width / 2 - 18,
//                                 height: 50,
//                                 child: TextField(
//                                   decoration:
//                                       customInputDecoration('Cost Estimation'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           heigh10,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width / 2.5,
//                                 height: 50,
//                                 decoration: customBoxDecoration(),
//                                 child: const Padding(
//                                   padding: EdgeInsets.all(16.0),
//                                   child: Text('Change'),
//                                 ),
//                               ),
//                               Container(
//                                 width:
//                                     MediaQuery.of(context).size.width / 2 - 18,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 decoration: customBoxDecoration(),
//                                 child: DropdownButton(
//                                   value: serviceTypeList[index],
//                                   underline: const SizedBox(),
//                                   items: _serviceTypeDropdown
//                                       .map((value) => DropdownMenuItem(
//                                             value: value,
//                                             child: Text(value),
//                                           ))
//                                       .toList(),
//                                   onChanged: (value) {
//                                     serviceTypeList[index] = value!;
//                                     setState(() {});
//                                   },
//                                   isExpanded: true,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return heigh10;
//                 },
//                 itemCount: 10)
//           ],
//         ),
//       ),
//       floatingActionButton: Container(
//         width: 143,
//         height: 35,
//         child: ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all<Color>(
//                 const Color.fromARGB(255, 255, 90, 95)),
//           ),
//           onPressed: () {
//             Architectbottomnavigationbar(
//               selectedindex: 0,
//             );

//           },
//           child: const Text('Next'),
//         ),
//       ),
//     );
//   }
// }
