// ignore_for_file: must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, sized_box_for_whitespace, prefer_final_fields
import 'package:flutter/material.dart' ;
import 'package:salon_app/pages/home/constants.dart' ;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


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

// Popular and Book Again
class Heading extends StatelessWidget {
  String text ;
  Heading({ Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(
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
      style: const TextStyle(
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
      style: const TextStyle(
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
  Icon addIcon = const Icon(Icons.add, color: Colors.white, size: 24.0);
  Icon deleteIcon =  const Icon(Icons.check, color: Colors.white, size: 18.0);
  
  bool _icon = true ;  
  void changeIcon(){
    setState(() {
      _icon = !_icon ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
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
                      child: Image.asset(widget.image,
                      fit: BoxFit.fitHeight,
                    ),
                    ),
                  ),

                const SizedBox(width: 16.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallCardTitle(text: widget.title),
                    Container(height: 8.0),
                    Row(
                      children: [
                        SmallCardSubtitle(text: widget.time + ' min'),
                        
                        Container(
                          margin: const EdgeInsets.all(4.0),
                          height: 4.0,
                          width: 4.0,
                          decoration: BoxDecoration(
                            color: kHeadingColor,
                            borderRadius: BorderRadius.circular(4.0),
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
              borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  height: 24.0,
                  width: 24.0,
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
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
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
      style: const TextStyle(
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
      style: const TextStyle(
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
  Icon deleteIcon =  const Icon(Icons.check, color: Colors.white, size: 32.0);
  Icon addIcon = const Icon(Icons.add, color: Colors.white, size: 38.0);
  
  bool _icon = true ;  
  void changeIcon(){
    setState(() {
      _icon = !_icon ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 329.0,
                height: 196.0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: Image.asset(widget.image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
              ),
        
              Container(
                width: 329,
                height: 138,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CategoryCardTitle(text: widget.title),
                        // const SizedBox(height: 2),
                        CategoryCardSubtitle(text: widget.time + ' min'),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const StarRating(),
                            const SizedBox(width: 8),
                            CategoryCardSubtitle(text: widget.numOfRatings + ' ratings')
                          ]
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: changeIcon,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            height: 38.0,
                            width: 38.0,
                            color: kMainPurpleColor,
                            child: _icon ? addIcon: deleteIcon,
                          ),
                      ),
                    ),
                  ],
                ),
            ),
          ]),
        Positioned(
          top: 174,
          left: 225,
          child: Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
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
