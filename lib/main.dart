// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, non_constant_identifier_names, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Pages
import 'package:salon_app/pages/home/homePage.dart' ;
import 'package:salon_app/pages/search/searchPage.dart' ;
import 'package:salon_app/pages/bag/bagPage.dart' ;
import 'package:salon_app/pages/profile/ProfilePage.dart' ;


void main() {
  runApp(MyApp());
  // Makes app full screen | package:services.dart
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salon App',
      theme: ThemeData(fontFamily: 'KumbhSans'),
      initialRoute: '0',
      routes:{
        '0': (context) => const HomePage(),
        '1': (context) => const SearchPage(),
        '2': (context) => const BagPage(),
        '3': (context) => const ProfilePage(),
      },
    );
  }
}
