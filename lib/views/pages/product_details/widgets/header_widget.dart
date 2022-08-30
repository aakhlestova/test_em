import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/views/theme/colors.dart';
import 'package:test_em/views/theme/text_styles.dart';

import '../../../../constants.dart';

/// виджет с хедером, кнопкой Назад и кнопкой Корзина (страница Product Details)
class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
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
              onPressed: () {},
              icon: Center(child: Image.asset('assets/images/productDetails/cart.png', height: 14.0,))),
          ),
        ),
      ],
    );
  }
}
