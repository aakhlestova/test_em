import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/views/global_widgets/buttons.dart';
import 'package:test_em/views/theme/colors.dart';

import '../theme/text_styles.dart';


class ProductCardWidget extends StatefulWidget {
  final String title;
  final bool isFavorites;
  final String picture;
  final int priceWithoutDiscount;
  final int discountPrice;
  const ProductCardWidget({Key? key, required this.title, required this.isFavorites, required this.picture, required this.priceWithoutDiscount, required this.discountPrice, }) : super(key: key);

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState(title, isFavorites, picture, priceWithoutDiscount, discountPrice);
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  final String title;
  final bool isFavorites;
  final String picture;
  final int priceWithoutDiscount;
  final int discountPrice;
  _ProductCardWidgetState(this.title, this.isFavorites, this.picture, this.priceWithoutDiscount, this.discountPrice);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: widgetBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 40.0,
              color: cardShadowColor
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 177.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(picture),
                        fit: BoxFit.fitHeight
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21.0, right: 21.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            discountPrice.toString(),
                            style: cardProductPriceTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0, bottom: 2.0),
                            child: Text(
                              priceWithoutDiscount.toString(),
                              style: cardProductOldPriceTextStyle,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          title,
                          style: cardProductNameTextStyle,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 11.0,
              right: 13.0,
              child: FavoritesButton(isFavorites: isFavorites,),
            )
          ],
        ),
      ),
    );
  }
}
