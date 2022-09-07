import 'package:flutter/cupertino.dart';
import 'package:test_em/src/presentation/pages/product_details/widgets/tab_product_widget.dart';

import '../../../../data/models/product_details_model.dart';
import '../../../global_widgets/buttons.dart';
import '../../../global_widgets/product_rating_bar.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';


class ProductInfoWidget extends StatefulWidget {

  final ProductDetails productDetailsDataList;
  const ProductInfoWidget({Key? key, required this.productDetailsDataList}) : super(key: key);

  @override
  _ProductInfoWidgetState createState() => _ProductInfoWidgetState(productDetailsDataList);
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  final ProductDetails productDetailsDataList;
  _ProductInfoWidgetState(this.productDetailsDataList);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: widgetBackgroundColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,-5),
            blurRadius: 20.0,
            color: productInfoShadowColor
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productDetailsDataList.title.toString(),
                  style: headingSecondTextStyle,
                ),
                FavoriteProductButton(isFavorites: productDetailsDataList.isFavorites!),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7.0),
              child: ProductRatingBar(rating: productDetailsDataList.rating!),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: TabProductWidget(productDetailsDataList: productDetailsDataList,),
            ),
          ],
        ),
      ),
    );
  }
}
