// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:salon_app/pages/bag/widgets.dart' ;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_app/pages/global_constants.dart' ;


class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  List<BagCard> list = [
      BagCard(image: 'public/images/facial.jpg', title: 'Gold Facial', time: '40', amount: '450'),
      BagCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', time: '50', amount: '550'),
    ];

    void _onItemTapped(int index) {
      setState(() {
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
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/home.svg'),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/search.svg'),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/bag.svg', color: mainPurpleColor),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/profile.svg'),label: ''),
        ],
      ),

        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIdScrolled) => [
              SliverAppBar(
              title: TopBarTitle(text: 'My bag'),
              centerTitle: true,
              backgroundColor: Colors.white,
              floating: true,
            ),
          ], 

          body: ListView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                children: [
                  Column(children: list),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xFFF1F1F1),
                  ),
                  Totalling(time: '70', amount: '1100'),
                  const SizedBox(height: 100),
                  const BottomOptions(),
                ],
              ),
          ),
      );
  }
}
