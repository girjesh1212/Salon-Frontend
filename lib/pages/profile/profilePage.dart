// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, file_names, non_constant_identifier_names, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:salon_app/pages/profile/widgets.dart' ;
import 'package:salon_app/pages/profile/constants.dart' ;
import 'package:salon_app/pages/global_constants.dart' ;
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _profile = true ;

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
        currentIndex: 3,
        onTap: _onItemTapped,
        selectedItemColor: mainPurpleColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/home.svg'),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/search.svg'),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/bag.svg'),label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset('public/icons/profile.svg', color: mainPurpleColor),label: ''),
        ],
      ),

      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIdScrolled) => [
            SliverAppBar(
            title: TopBarTitle(text: 'User Details'),
            centerTitle: true,
            backgroundColor: Colors.white,
            floating: true,
          ),
        ], 

        body: ListView(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                              setState((){
                                _profile = !_profile ;
                              });
                            },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            width: 280,
                            height: 38,
                            color: const Color(0xFFF7F7F7),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState((){
                                _profile = true;
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                alignment: Alignment.center,
                                width: 140,
                                height: 38,
                                color: _profile ? kMainPurpleColor : null,
                                child: Text('Profile',
                                    style: TextStyle(
                                      color: _profile ? kMenuFontLightColor : kMenuFontDarkColor,
                                      fontSize: kMenuFontSize,
                                      fontWeight: kMenuFontWeight,
                                    ),
                                  ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                _profile = false;
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                alignment: Alignment.center,
                                width: 140,
                                height: 38,
                                color: _profile ? null : kMainPurpleColor,
                                child: Text('Bookings',
                                    style: TextStyle(
                                      color: _profile ? kMenuFontDarkColor : kMenuFontLightColor,
                                      fontSize: kMenuFontSize,
                                      fontWeight: kMenuFontWeight,
                                    ),
                                  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),  // Padding
                  _profile ? const ProfileInfo() : BookingsInfo(),
                ],
              ),
      ),
    );
  }
}



