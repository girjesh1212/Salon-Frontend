// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, prefer_final_fields
import 'package:flutter/material.dart' ;
import 'package:salon_app/pages/bag/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';


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

//BagItems
class BagCardTitle extends StatelessWidget {
  String text ;
  BagCardTitle({ Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(
        fontSize: kTitleSize,
        fontWeight: kTitleWeight,
        color: kTitleColor,
      ),
    );
  }
}

class BagCardSubtitle extends StatelessWidget {
  String text ;
  BagCardSubtitle({ Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(
        fontSize: kSubtitleSize,
        fontWeight: kSubtitleWeight,
        color: kSubtitleColor,
      ),
    );
  }
}

class BagCard extends StatelessWidget {
  String title, time, amount, image;
  BagCard({ Key? key, 
  required this.title, 
  required this.time, 
  required this.image,
  required this.amount,
  }) : super(key: key);

  SvgPicture icon = SvgPicture.asset('public/icons/trash.svg', color: kDeleteIconColor);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
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
                      fit: BoxFit.fitHeight,
                    ),
                    ),
                  ),

                const SizedBox(width: 16.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BagCardTitle(text: title),
                    Container(height: 8.0),
                    Row(
                      children: [
                        BagCardSubtitle(text: time + ' min'),
                        
                        Container(
                          margin: const EdgeInsets.all(4.0),
                          height: 4.0,
                          width: 4.0,
                          decoration: BoxDecoration(
                            color: kTitleColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        BagCardSubtitle(text: '₹' + amount),
                      ]
                    ),
                  ]
                ),
            ]
          ),
          icon,
        ],
      ),
    );
  }
}

//Totalling 
class TotalTime extends StatelessWidget {
  String time;
  TotalTime({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(time + ' min', 
      style: const TextStyle(
        fontSize: kTimeTextSize,
        fontWeight: kTimeTextWeight,
        color: kTimeTextColor,
      ),
    );
  }
}

class TotalAmount extends StatelessWidget {
  String amount;
  TotalAmount({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('₹' + amount, 
      style: const TextStyle(
        fontSize: kAmountTextSize,
        fontWeight: kAmountTextWeight,
        color: kAmountTextColor,
      ),
    );
  }
}

//Add Item and Proceed
class AddItemBox extends StatelessWidget {
  const AddItemBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:114,
      height:43,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kMainPurpleColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('Add items', 
        style: TextStyle(
          fontSize: kTimeTextSize,
          fontWeight: kTimeTextWeight,
          color: kMainPurpleColor,
        ),
      ),
    );
  }
}

class ProceedBox extends StatelessWidget {
  const ProceedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:101,
      height:43,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kMainPurpleColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('Proceed', 
        style: TextStyle(
          fontSize: kTimeTextSize,
          fontWeight: kTimeTextWeight,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BottomOptions extends StatelessWidget {
  const BottomOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: Row(
        children: const [
          AddItemBox(),
          SizedBox(width: 58),
          ProceedBox(),
        ],
      ),
    );
  }
}

class Totalling extends StatelessWidget {
  String time, amount;
  Totalling({
    Key? key,
    required this.time,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TotalTime(time:time),
          TotalAmount(amount: amount),
        ],
      ),
    );
  }
}
