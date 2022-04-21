// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, prefer_final_fields, unused_import
import 'package:flutter/material.dart' ;
import 'package:salon_app/pages/search/constants.dart' ;
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

//Top Bar 
class TopBarTitle extends StatelessWidget {
  String text;
  TopBarTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Color(0xFF25082C)),
    );
  }
}

//SearchBar
class SearchBarText extends StatelessWidget {
  String text;
   SearchBarText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(
        fontSize: kSearchFontSize,
        color: kSearchFontColor,
        fontWeight: kSearchFontWeight,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  String text ;
  SearchBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14,11,14,11),
      width: 300,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF081D2C).withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 0.0,  
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset('public/icons/search.svg', color: kMainPurpleColor),
          const SizedBox(width: 20),
          SearchBarText(text: text),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String text ; 
  const ListItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
            style: const TextStyle(
              fontSize: kFontSize,
              fontWeight: kFontWeight,
              color: kFontColor,
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: const Icon(Icons.arrow_back_ios_new_rounded, color: kArrowColor, size: 16.0),
            ),
        ],
      ),
    );
  }
}
