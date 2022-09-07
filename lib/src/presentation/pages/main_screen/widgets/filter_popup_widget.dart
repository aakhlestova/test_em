import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/src/constants.dart';
import '../../../../data/models/main_screen_model.dart';
import '../../../global_widgets/buttons.dart';
import '../../../global_widgets/text_fields.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class FilterPopupWidget extends StatefulWidget {
  final List<BestSeller> bestSellerDataList;
  const FilterPopupWidget({Key? key, required this.bestSellerDataList}) : super(key: key);

  @override
  _FilterPopupWidgetState createState() => _FilterPopupWidgetState(bestSellerDataList);
}

class _FilterPopupWidgetState extends State<FilterPopupWidget> {

  final List<BestSeller> bestSellerDataList;
  _FilterPopupWidgetState(this.bestSellerDataList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widgetBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: _filterHeader(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: _filterBody(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _filterHeader(){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        child: Container(
          height: 37.0,
          width: 37.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: blueAccentColor,
          ),
          child: Center(child: Image.asset('assets/images/home/close_popup.png', height: 10.0,))
        ),
        onTap: () => Get.back(),
      ),
      DefaultTextStyle(
        style: headingThirdTextStyle  ,
        child: Text(
          filterHeadingText,
        ),
      ),
      FilterApplyButton(),
    ],
  );
}

Widget _filterBody(){

  List <String> brandsList = ['Samsung', 'Iphone', 'Xiaomi', 'Motorola'];
  List <String> pricesList = ['0 - 10000\$'];
  List <String> sizesList = ['4.5 to 5.5 inches'];


  return
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  brandText,
                  style: filterHeadingTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FilterTextField(itemsList: brandsList),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  priceText,
                  style: filterHeadingTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FilterTextField(itemsList: pricesList),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sizeText,
                  style: filterHeadingTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FilterTextField(itemsList: sizesList),
                ),
              ],
            ),
          ),
        ],
      );
}