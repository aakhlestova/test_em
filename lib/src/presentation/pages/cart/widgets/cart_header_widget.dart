import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/src/constants.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class CartHeaderWidget extends StatefulWidget {
  const CartHeaderWidget({Key? key}) : super(key: key);

  @override
  _CartHeaderWidgetState createState() => _CartHeaderWidgetState();
}

class _CartHeaderWidgetState extends State<CartHeaderWidget> {
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
                icon: Center(child: Image.asset('assets/images/cart/arrow_back.png', height: 14.0,))),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 9.0),
              child: Text(
                addressText,
                style: appBarTextStyle,
              ),
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
                    icon: Center(child: Image.asset('assets/images/cart/location.png', height: 18.0,))),
              ),
            ),
          ],
        ),
      ],
    );

  }
}
