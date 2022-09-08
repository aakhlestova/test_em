import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRatingBar extends StatefulWidget {
  final double rating;
  const ProductRatingBar({Key? key, required this.rating}) : super(key: key);

  @override
  _ProductRatingBarState createState() => _ProductRatingBarState(rating);
}

class _ProductRatingBarState extends State<ProductRatingBar> {
  final double rating;
  _ProductRatingBarState(this.rating);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 18.0,
      itemPadding: EdgeInsets.only(right: 9.0),
    );
  }
}