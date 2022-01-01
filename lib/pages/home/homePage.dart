// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, file_names
import 'package:flutter/material.dart';
import 'package:salon_app/pages/home/widgets.dart' ;

import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io' show Platform;



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var popularArray = [
    SmallCard(image: 'public/images/facial.jpg', title: 'Gold Facial', time: '40', amount: '450'),
    SmallCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', time: '50', amount: '550'),
  ];

  var bookAgainArray = [
    SmallCard(image: 'public/images/haircut.jpg', title: 'Bridal Haircut', time: '40', amount: '450'),
    SmallCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', time: '50', amount: '550'),
  ];

  var categoryCardsArray = [      // Here comes all cards
    CategoryCard(
      image: 'public/images/facial.jpg',
      title: 'Facial', 
      time: '40', 
      price: '450',
      numOfRatings: '10'
      ),
    CategoryCard(
      image: 'public/images/haircut.jpg',
      title: 'Bridal Haircut', 
      time: '25', 
      price: '650',
      numOfRatings: '4',
      ),

      CategoryCard(
      image: 'public/images/facial.jpg',
      title: 'Facial', 
      time: '40', 
      price: '450',
      numOfRatings: '10'
      ),
    CategoryCard(
      image: 'public/images/haircut.jpg',
      title: 'Bridal Haircut', 
      time: '25', 
      price: '650',
      numOfRatings: '4',
      ),
      CategoryCard(
      image: 'public/images/facial.jpg',
      title: 'Facial', 
      time: '40', 
      price: '450',
      numOfRatings: '10'
      ),
    CategoryCard(
      image: 'public/images/haircut.jpg',
      title: 'Bridal Haircut', 
      time: '25', 
      price: '650',
      numOfRatings: '4',
      ),
  ];

  Color mainPurpleColor = const Color(0xFFBC4CE3) ;
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
        currentIndex: 0,
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
                    title: TopBarTitle(text: 'Home'),
                    centerTitle: true,
                    backgroundColor: Colors.white,
                  ),
                ], 
                body: ListView(
                padding: const EdgeInsets.fromLTRB(24.0, 0.0, 16.0, 16.0),
                children: [
                  CategoryBox(title: 'Popular', services: popularArray),
                  CategoryBox(title: 'Book Again', services: bookAgainArray),
                  CategoriesList(categoryCards: categoryCardsArray),
                ]
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
