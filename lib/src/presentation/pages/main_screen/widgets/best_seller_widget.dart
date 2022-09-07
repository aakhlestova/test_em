import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/src/constants.dart';

import '../../../../data/models/main_screen_model.dart';
import '../../../global_widgets/product_card_widget.dart';
import '../../../theme/text_styles.dart';


/// виджет с товарами бестселлерами (главная страница)
class BestSellerWidget extends StatefulWidget {
  final List<BestSeller> bestSellerDataList;
  const BestSellerWidget({Key? key, required this.bestSellerDataList}) : super(key: key);

  @override
  _BestSellerWidgetState createState() => _BestSellerWidgetState(bestSellerDataList);
}

class _BestSellerWidgetState extends State<BestSellerWidget> {
  final List<BestSeller> bestSellerDataList;
  _BestSellerWidgetState(this.bestSellerDataList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              bestSellerHeading,
              style: headingFirstTextStyle,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  seeMoreText,
                  style: accentTextStyle,
                ))
          ],
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 14.0,
              childAspectRatio: 1/1.5
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: bestSellerDataList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCardWidget(
                title: bestSellerDataList[index].title.toString(),
                isFavorites: bestSellerDataList[index].isFavorites!,
                picture: bestSellerDataList[index].picture.toString(),
                priceWithoutDiscount: bestSellerDataList[index].priceWithoutDiscount!,
                discountPrice: bestSellerDataList[index].discountPrice!,
              );
            }),
      ],
    );
  }
}
