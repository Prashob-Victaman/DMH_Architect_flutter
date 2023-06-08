import 'package:dmh_architect/Architect/ArchitectForm/architect_office_details.dart';
import 'package:dmh_architect/Architect/ArchitectForm/servicerateUpdated.dart';
import 'package:dmh_architect/Architect/productview/widget/designThisTypeofHouse.dart';
import 'package:flutter/material.dart';

import '../../Constants/constants.dart';
import '../ArchitectDesignpage/designPage.dart';
import '../ArchitectForm/ArchitectUploadDesign/ArchitectUploadDesign.dart';
import '../ArchitectProfile/architectprofilepage.dart';
import '../Architecthomepage/Architecthomepage.dart';

class Architectbottomnavigationbar extends StatefulWidget {
  int selectedindex;
  Architectbottomnavigationbar({super.key, required this.selectedindex});

  @override
  _ArchitectbottomnavigationbarState createState() =>
      _ArchitectbottomnavigationbarState();
}

class _ArchitectbottomnavigationbarState
    extends State<Architectbottomnavigationbar> {
  // int _selectedIndex = widget.selectedindex;

  final List<Widget> _screens = [
    ArchitecthomePage(),
    const ArchitectDesignPage(),
    ArchitectUploadDesign(),
    // ArchitectOfficeDetails(),
    // ArchitectOfficeDetails(),
    // ServiceRateUpdated(),
    // DesignThisTypeOfHouse(),
    ArchitectProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[widget.selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: kgreycolor,
        unselectedLabelStyle: const TextStyle(color: kgreycolor),
        selectedItemColor: kprimarycolor,
        selectedIconTheme: const IconThemeData(fill: 0),
        currentIndex: widget.selectedindex,
        onTap: (index) {
          setState(() {
            widget.selectedindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Design',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload_outlined),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
