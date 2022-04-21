// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, file_names
import 'package:flutter/material.dart';
import 'package:salon_app/pages/home/widgets.dart' ;
import 'package:salon_app/pages/global_constants.dart' ;

import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Class properties
  List<Widget> popularArray = [
    SmallCard(image: 'public/images/facial.jpg', title: 'Gold Facial', time: '40', amount: '450'),
    SmallCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', time: '50', amount: '550'),
  ];

  List<Widget> bookAgainArray = [
    SmallCard(image: 'public/images/haircut.jpg', title: 'Bridal Haircut', time: '40', amount: '450'),
    SmallCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', time: '50', amount: '550'),
  ];

  List<CategoryCard> categoryCardsArray = [      // Here comes all cards
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

// Class method
    void _onItemTapped(int index) {
      setState(() {
        Navigator.popAndPushNamed(context, index.toString());
      });
    }
  
  // Polymorphism
  @override
  Widget build(BuildContext context) {
    screenWidth ??= MediaQuery.of(context).size.width;
    screenHeight ??= MediaQuery.of(context).size.height;
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
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/home.svg', color: mainPurpleColor),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/search.svg'),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/bag.svg'),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/profile.svg'),label: ''),
        ],
      ),

        body: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIdScrolled) => [
                SliverAppBar(
                  title: TopBarTitle(text: 'Home'),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  floating: true,
                ),
              ], 
              body: ListView(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
              children: [
                CategoryBox(title: 'Popular', services: popularArray),
                CategoryBox(title: 'Book Again', services: bookAgainArray),
                CategoriesList(categoryCards: categoryCardsArray),
              ]
            ),
          ),
        ),
      );
  }
}
