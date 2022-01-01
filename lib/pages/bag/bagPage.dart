// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:salon_app/pages/bag/widgets.dart' ;

import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io' show Platform;


class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  var List = [
      BagCard(image: 'public/images/facial.jpg', title: 'Gold Facial', time: '40', amount: '450'),
      BagCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', time: '50', amount: '550'),
    ];

    static const Color mainPurpleColor = Color(0xFFBC4CE3) ;
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        Navigator.popAndPushNamed(context, index.toString());
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: 2,
        onTap: _onItemTapped,
        selectedItemColor: mainPurpleColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(activeIcon: SvgPicture.asset('public/icons/home.svg', color: mainPurpleColor), icon: SvgPicture.asset('public/icons/home.svg'),label: ''),
          BottomNavigationBarItem(activeIcon: SvgPicture.asset('public/icons/search.svg', color: mainPurpleColor), icon: SvgPicture.asset('public/icons/search.svg'),label: ''),
          BottomNavigationBarItem(activeIcon: SvgPicture.asset('public/icons/bag.svg', color: mainPurpleColor), icon: SvgPicture.asset('public/icons/bag.svg'),label: ''),
          BottomNavigationBarItem(activeIcon: SvgPicture.asset('public/icons/profile.svg', color: mainPurpleColor), icon: SvgPicture.asset('public/icons/profile.svg'),label: ''),
        ],
      ),

        body: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIdScrolled) => [
                  SliverAppBar(
                  title: TopBarTitle(text: 'My bag'),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                ),
              ], 

              body: Stack(
                alignment: Alignment.center,
                children: [
                  ListView(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    children: [
                      Column(children: List),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: const Color(0xFFF1F1F1),
                      ),
                      Totalling(time: '70', amount: '1100'),
                      const SizedBox(height: 100),
                    ],
                  ),
                  const BottomOptions(),
                ],
              ),
                ),
             Container(
              height: Platform.isIOS ? 35 : 0,
              width: double.infinity,
              color: Colors.white,
            ),
          ],
          ),
      );
  }
}
