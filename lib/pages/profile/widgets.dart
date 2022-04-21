// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, prefer_final_fields, unused_import
import 'package:flutter/material.dart' ;
import 'package:salon_app/pages/profile/constants.dart' ;

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

//Profile
class Subtitle extends StatelessWidget {
  String text ;
  Subtitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(
      fontWeight: kSubtitleWeight,
      fontSize: kSubtitleSize,
      color: kSubtitleColor,
      ),
    );
  }
}

class Field extends StatelessWidget {
  String title, subtitle;
  Field({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: const TextStyle(
              fontWeight: kTitleWeight,
              fontSize: kTitleSize,
              color: kTitleColor,
            ),
          ),
          const SizedBox(height:4),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            width: double.infinity,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE8E8E8))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Subtitle(text: subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Field(title: 'Name', subtitle: 'Juhi Sharma'),
        Field(title: 'Contact', subtitle: '971xxxxx26'),
        Field(title: 'Address', subtitle: '21, New Society, Dayal Bagh Agra'),
      ],
    );
  }
}

//Bookings
class BookingsCard extends StatelessWidget {
  String title, date, image;
  BookingsCard({
    Key? key,
    required this.title,
    required this.date,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      padding: const EdgeInsets.fromLTRB(16,8,16,8),
      margin: const EdgeInsets.only(top:8, bottom:8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF081D2C).withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 0.0,  
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    child: Image.asset(image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(width: 16.0),
              Text(title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF25082C),
                ),
              ),
            ],
          ),
          Text(date,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF787878),
            ),
          ),
        ],
      ),
    );
  }
}

class BookingsInfo extends StatelessWidget {
  BookingsInfo({
    Key? key,
  }) : super(key: key);

  var bookingCards = [
    BookingsCard(image: 'public/images/facial.jpg', title: 'Gold Facial', date: '28/12/2021'),
    BookingsCard(image: 'public/images/haircut.jpg', title: 'Bridal Haircut', date: '24/12/2021'),
    BookingsCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', date: '21/12/2021'),
    BookingsCard(image: 'public/images/facial.jpg', title: 'Gold Facial', date: '12/12/2021'),
    BookingsCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', date: '04/12/2021'),
    BookingsCard(image: 'public/images/haircut.jpg', title: 'Bridal Haircut', date: '01/12/2021'),
    
    BookingsCard(image: 'public/images/facial.jpg', title: 'Gold Facial', date: '28/12/2021'),
    BookingsCard(image: 'public/images/haircut.jpg', title: 'Bridal Haircut', date: '24/12/2021'),
    BookingsCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', date: '21/12/2021'),
    BookingsCard(image: 'public/images/facial.jpg', title: 'Gold Facial', date: '12/12/2021'),
    BookingsCard(image: 'public/images/legwaxing.jpg', title: 'Leg Waxing', date: '04/12/2021'),
    BookingsCard(image: 'public/images/haircut.jpg', title: 'Bridal Haircut', date: '01/12/2021'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: bookingCards,
    );
  }
}
