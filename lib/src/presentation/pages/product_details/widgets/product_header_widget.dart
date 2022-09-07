import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';
import '../../cart/cart_page.dart';

/// виджет с хедером, кнопкой Назад и кнопкой Корзина (страница Product Details)
class ProductHeaderWidget extends StatefulWidget {
  const ProductHeaderWidget({Key? key}) : super(key: key);

  @override
  _ProductHeaderWidgetState createState() => _ProductHeaderWidgetState();
}

class _ProductHeaderWidgetState extends State<ProductHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 37.0,
          width: 37.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: blueAccentColor,
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Center(child: Image.asset('assets/images/productDetails/arrow_back.png', height: 14.0,))),
          ),
        ),
        Text(
          productDetailsHeader,
          style: headingThirdTextStyle,
        ),
        SizedBox(
          height: 37.0,
          width: 37.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: orangeAccentColor,
            ),
            child: IconButton(
              onPressed: () => Get.to(CartPage()),
              icon: Center(child: Image.asset('assets/images/productDetails/cart.png', height: 14.0,))),
          ),
        ),
      ],
    );
  }
}
