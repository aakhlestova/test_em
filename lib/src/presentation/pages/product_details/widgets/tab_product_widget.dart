import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/src/constants.dart';

import '../../../../data/models/product_details_model.dart';
import '../../../../domain/controllers/product_details_controller.dart';
import '../../../global_widgets/buttons.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';
import 'capacity_selector_widget.dart';
import 'color_selector_widget.dart';

class TabProductWidget extends StatefulWidget {
  const TabProductWidget({Key? key, }) : super(key: key);

  @override
  _TabProductWidgetState createState() => _TabProductWidgetState();
}

class _TabProductWidgetState extends State<TabProductWidget> {
  final ProductDetailsController productDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    ProductDetails productDetailsDataList = productDetailsController.productDetails.value;
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelStyle: activeProductTabTextStyle,
            labelColor: primaryTextColor,
            unselectedLabelStyle: inactiveProductTabTextStyle,
            unselectedLabelColor: inactiveProductTabTextColor,
            indicatorColor: orangeAccentColor,
            indicatorWeight: 3.0,
            indicatorPadding: EdgeInsets.only(top: 8.0),
            tabs: [
              Tab(
                text: shopTabText,
              ),
              Tab(
                text: detailsTabText,
              ),
              Tab(
                text: featuresTabText,
              ),
            ],
          ),
          Container(
            height: 270,
            child: TabBarView(
              children: [
                Container(
                  child: Column(
                    children: [
                      _extraInfo(productDetailsDataList),
                      _modificationsSelection(productDetailsDataList),
                      Padding(
                        padding: const EdgeInsets.only(top: 27.0),
                        child: AddToCartButton(price: productDetailsDataList.price!,),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    'Details tab',
                    style: unselectedCapacityButtonTextStyle,
                  )
                ),
                Center(
                  child: Text(
                    'Features tab',
                    style: unselectedCapacityButtonTextStyle,
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _extraInfo( ProductDetails productDetailsDataList){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getItemExtraInfo(productDetailsDataList.cpu.toString(), 'assets/images/productDetails/cpu.png', 28.0,),
        _getItemExtraInfo(productDetailsDataList.camera.toString(), 'assets/images/productDetails/camera.png', 22.0,),
        _getItemExtraInfo(productDetailsDataList.ssd.toString(), 'assets/images/productDetails/ssd.png', 21.0,),
        _getItemExtraInfo(productDetailsDataList.sd.toString(), 'assets/images/productDetails/sd.png', 22.0,),
      ],
    ),
  );
}

Widget _getItemExtraInfo(String text, String image, double height){
  return Column(
    children: [
      Image.asset(image, height: height,),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          text,
          style: extraInfoTextStyle,
        ),
      )
    ],
  );
}

Widget _modificationsSelection ( ProductDetails productDetailsDataList) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        selectionText,
        style: productSelectionTextStyle,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            ColorSelectorWidget(productDetailsDataList: productDetailsDataList),
            CapacitySelectorWidget(productDetailsDataList: productDetailsDataList)
          ],
        ),
      ),
    ],
  );
}
