import 'package:flutter/material.dart';

const Color orangeAccentColor = Color(0xFFFF6E4E);
const Color blueAccentColor = Color(0xFF010035);

const Color screenBackgroundColor = Color(0xFFF8F8F8);
const Color widgetBackgroundColor = Color(0xFFFFFFFF);

const Color primaryTextColor = Color(0xFF010035);
const Color primaryWithOpacityTextColor = Color(0x80010035);
const Color accentTextColor = Color(0xFFFF6E4E);
const Color secondaryTextColor = Color(0xFFCCCCCC);
const Color whiteTextColor = Color(0xFFFFFFFF);
const Color inactiveProductTabTextColor = Color(0x80000000);
const Color infoProductTextColor = Color(0xFFB7B7B7);
const Color unselectedCapacityTextColor = Color(0xFF8D8D8D);

const Color carouselButtonColor = Color(0xFFFFFFFF);
const Color cardShadowColor = Color(0x1FAAB6D3);
const Color favoriteButtonColor = Color(0x26000000);

const Color productPhotoShadowColor = Color(0x26374E88);
const Color productInfoShadowColor = Color(0x1A4C5F8F);

const Color amountCounterColor = Color(0xFF282843);
const Color whiteBorderColor = Color(0x40FFFFFF);

/// функция перевода строки в цвет
Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}




