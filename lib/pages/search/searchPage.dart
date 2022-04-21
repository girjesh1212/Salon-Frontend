// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:salon_app/pages/search/widgets.dart' ;
import 'package:salon_app/pages/global_constants.dart' ;

import 'package:flutter_svg/flutter_svg.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var List = [
    const ListItem(text: 'Mehandi'),
    const ListItem(text: 'Makeup'),
    const ListItem(text: 'Facial'),
    const ListItem(text: 'Waxing'),
    const ListItem(text: 'Manicure'),
    const ListItem(text: 'Pedicure'),
    const ListItem(text: 'Eyebrows'),
    const ListItem(text: 'Bridal'),
  ];

  static const Color mainPurpleColor = Color(0xFFBC4CE3) ;

  @override
  Widget build(BuildContext context) {
    
    void _onItemTapped(int index) {
      setState(() {
        Navigator.popAndPushNamed(context, index.toString());
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: 1,
        onTap: _onItemTapped,
        selectedItemColor: mainPurpleColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/home.svg'),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/search.svg', color: mainPurpleColor),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/bag.svg'),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/profile.svg'),label: ''),
        ],
      ),

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIdScrolled) => [
            SliverAppBar(
            title: TopBarTitle(text: 'Search'),
            centerTitle: true,
            backgroundColor: Colors.white,
            floating: true,
          ),
        ], 

        body: ListView(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 12),
          children: [
            SearchBar(text: 'Search Something...'), // Search Box
            const SizedBox(height:32),    // Padding
            Column(children: List),
          ],
        ),
      ),
    );
  }
}
