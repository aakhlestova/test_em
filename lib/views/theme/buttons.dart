import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/constants.dart';
import 'package:test_em/views/theme/colors.dart';
import 'package:test_em/views/theme/text_styles.dart';

/// кнопка категории из Select Category
class TabCategoryButton extends StatelessWidget {
  final String title;
  final String icon;
  final String icon_active;
  final int selectedCategory;
  final int categoryNumber;
  final Function onPressed;

  const TabCategoryButton({Key? key, required this.title, required this.icon, required this.selectedCategory, required this.categoryNumber, required this.icon_active, required this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 20.0),
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Column(
          children: [
            Container(
              height: 71.0,
              width: 71.0,
              decoration: BoxDecoration(
                color:  selectedCategory == categoryNumber ? orangeAccentColor : widgetBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SizedBox(
                  height: 30.0,
                  child: selectedCategory == categoryNumber ? Image.asset(icon_active,) : Image.asset(icon, ),
                ),
              )
            ),
            SizedBox(height: 7.0,),
            Text(
              title,
              style: selectedCategory == categoryNumber ? categoryAccentTextStyle : categoryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}

/// кнопка поиска по QR-коду
class QrSearchButton extends StatelessWidget {
  const QrSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.0,
      width: 34.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: orangeAccentColor
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/home/qr.png', height: 15.0,)),
    );
  }
}

/// кнопка Buy now в карусели
class CarouselButton extends StatefulWidget {
  const CarouselButton({Key? key}) : super(key: key);

  @override
  _CarouselButtonState createState() => _CarouselButtonState();
}

class _CarouselButtonState extends State<CarouselButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: widgetBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0, vertical: 5.0),
          child: Text(
            buyButton,
            style: carouselButtonTextStyle,
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

