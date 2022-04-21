// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, prefer_final_fields
import 'package:flutter/material.dart' ;
import 'package:salon_app/pages/home/constants.dart' ;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:salon_app/pages/global_constants.dart';

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
      style: TextStyle(fontSize: kHeadingSize, fontWeight: FontWeight.w700, color: Color(0xFF25082C)),
    );
  }
}

// Popular and Book Again
class Heading extends StatelessWidget {
  String text ;
  Heading({ Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
      fontSize: kHeadingSize,
      fontWeight: kHeadingWeight,
      color: kHeadingColor,
            ),
        );
  }
}

class SmallCardTitle extends StatelessWidget {
  String text ;
  SmallCardTitle({ Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: kTitleSize,
        fontWeight: kTitleWeight,
        color: kTitleColor,
      ),
    );
  }
}

class SmallCardSubtitle extends StatelessWidget {
  String text ;
  SmallCardSubtitle({ Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style:  TextStyle(
        fontSize: kSubtitleSize,
        fontWeight: kSubtitleWeight,
        color: kSubtitleColor,
      ),
    );
  }
}

class SmallCard extends StatefulWidget {
  String title, time, amount, image;
  SmallCard({ Key? key, 
  required this.title, 
  required this.time, 
  required this.image,
  required this.amount,
  }) : super(key: key);

  @override
  State<SmallCard> createState() => _SmallCardState();
}
class _SmallCardState extends State<SmallCard> {
  Icon addIcon = Icon(Icons.add, color: Colors.white, size: 24.0 * (1/375)*screenWidth!);
  Icon deleteIcon =  Icon(Icons.check, color: Colors.white, size: 18.0 * (1/375)*screenWidth!);
  
  bool _icon = true ;  
  void changeIcon(){
    setState(() {
      _icon = !_icon ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0 * (1/375)*screenWidth!, 8.0 * (1/375)*screenWidth!, 16.0 * (1/375)*screenWidth!, 8.0 * (1/375)*screenWidth!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0 * (1/375)*screenWidth!),
                    child: Container(
                      height: 60.0 * (1/375)*screenWidth!,
                      width: 60.0 * (1/375)*screenWidth!,
                      child: Image.asset(widget.image,
                      fit: BoxFit.cover,
                    ),
                    ),
                  ),

                SizedBox(width: 16.0 * (1/375)*screenWidth!),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallCardTitle(text: widget.title),
                    Container(height: 8.0 * (1/375)*screenWidth!),
                    Row(
                      children: [
                        SmallCardSubtitle(text: widget.time + ' min'),
                        
                        Container(
                          margin: EdgeInsets.all(4.0 * (1/375)*screenWidth!),
                          height: 4.0 * (1/375)*screenWidth!,
                          width: 4.0 * (1/375)*screenWidth!,
                          decoration: BoxDecoration(
                            color: kHeadingColor,
                            borderRadius: BorderRadius.circular(4.0 * (1/375)*screenWidth!),
                          ),
                        ),

                        SmallCardSubtitle(text: '₹' + widget.amount),
                      ]
                    ),
                  ]
                ),
            ]

          ),
          GestureDetector(
            onTap: changeIcon,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0 * (1/375)*screenWidth!),
                child: Container(
                  height: 24.0 * (1/375)*screenWidth!,
                  width: 24.0 * (1/375)*screenWidth!,
                  color: kMainPurpleColor,
                  child: _icon ? addIcon : deleteIcon,
                ),
              ),
          ),
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  String title;
  var services ;
  CategoryBox({
    Key? key,
    required this.title,
    this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0 * (1/375)*screenWidth!, bottom: 16.0 * (1/375)*screenWidth!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(text: title),
          Column(
            children: services,
          ),
        ],
      ),
    );
  }
}

// Categories
class CategoryCardTitle extends StatelessWidget {
  String text ;
  CategoryCardTitle({ Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: kCategoryCardTitleSize,
        fontWeight: kCategoryCardTitleWeight,
        color: kCategoryCardTitleColor,
      ),
    );
  }
}

class CategoryCardSubtitle extends StatelessWidget {
  String text ;
  CategoryCardSubtitle({ Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: kCategoryCardSubtitleSize,
        fontWeight: kCategoryCardSubtitleWeight,
        color: kCategoryCardSubtitleColor,
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  const StarRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 4,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 16,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}

class CategoryCard extends StatefulWidget {
  String title, time, numOfRatings, image, price ;
  CategoryCard({
    Key? key,
    required this.title,
    required this.time,
    required this.numOfRatings,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}
class _CategoryCardState extends State<CategoryCard> {
  Icon deleteIcon =  Icon(Icons.check, color: Colors.white, size: 32.0 * (1/375)*screenWidth!);
  Icon addIcon = Icon(Icons.add, color: Colors.white, size: 38.0 * (1/375)*screenWidth!);
  
  bool _icon = true ;  
  void changeIcon(){
    setState(() {
      _icon = !_icon ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16 * (1/375)*screenWidth!, bottom: 16 * (1/375)*screenWidth!),
      child: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1.7,
                child: Container(
                  width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0 * (1/375)*screenWidth!),
                        topRight: Radius.circular(16.0 * (1/375)*screenWidth!),
                      ),
                      child: Image.asset(widget.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                ),
              ),
        
              AspectRatio(
                aspectRatio: 2.36,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0 * (1/375)*screenWidth!),
                      bottomRight: Radius.circular(16.0 * (1/375)*screenWidth!),
                    ),
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
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 32 * (1/375)*screenWidth!),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CategoryCardTitle(text: widget.title),
                          CategoryCardSubtitle(text: widget.time + ' min'),
                          SizedBox(height: 12 * (1/375)*screenWidth!),
                          Row(
                            children: [
                              const StarRating(),
                              SizedBox(width: 8 * (1/375)*screenWidth!),
                              CategoryCardSubtitle(text: widget.numOfRatings + ' ratings')
                            ]
                          ),
                        ],
                      ),
                    ],
                  ),
                          ),
              ),
          ]),
        Positioned(
          top: 0.52*(screenWidth!-48),
          right: (screenWidth! - 48)*0.05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 80 * (1/375)*screenWidth!,
                height: 40 * (1/375)*screenWidth!,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0 * (1/375)*screenWidth!),
                  color: Colors.white,
                  boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 0.0,  
                          offset: const Offset(0.0, 0.0),
                        ),
                      ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryCardSubtitle(text: 'Rs'),
                    const SizedBox(width: 2),
                    CategoryCardTitle(text: widget.price),
                  ]
                ),
              ),
              SizedBox(height: 35 * (1/375)*screenWidth!),
              GestureDetector(
                      onTap: changeIcon,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0 * (1/375)*screenWidth!),
                          child: Container(
                            height: 38.0 * (1/375)*screenWidth!,
                            width: 38.0 * (1/375)*screenWidth!,
                            color: kMainPurpleColor,
                            child: _icon ? addIcon: deleteIcon,
                          ),
                      ),
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.categoryCards,
  }) : super(key: key);

  final List<CategoryCard> categoryCards;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(text: 'Categories'),
        Column(
          children: categoryCards,
        ),
      ]
    );
  }
}
