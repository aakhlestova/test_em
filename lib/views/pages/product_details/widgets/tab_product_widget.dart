import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:test_em/constants.dart';
import 'package:test_em/views/pages/product_details/widgets/capacity_selector_widget.dart';
import 'package:test_em/views/pages/product_details/widgets/color_selector_widget.dart';
import 'package:test_em/views/theme/colors.dart';
import 'package:test_em/views/theme/text_styles.dart';

import '../../../../models/product_details_model.dart';
import '../../../global_widgets/buttons.dart';

class TabProductWidget extends StatefulWidget {
  final ProductDetails productDetailsDataList;
  const TabProductWidget({Key? key, required this.productDetailsDataList}) : super(key: key);

  @override
  _TabProductWidgetState createState() => _TabProductWidgetState(productDetailsDataList);
}

class _TabProductWidgetState extends State<TabProductWidget> {
  final ProductDetails productDetailsDataList;
  _TabProductWidgetState(this.productDetailsDataList);

  @override
  Widget build(BuildContext context) {
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
        Column(
          children: [
            Image.asset('assets/images/productDetails/cpu.png', height: 28.0,),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                productDetailsDataList.cpu.toString(),
                style: extraInfoTextStyle,
              ),
            )
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/productDetails/camera.png', height: 22.0,),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                productDetailsDataList.camera.toString(),
                style: extraInfoTextStyle,
              ),
            )
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/productDetails/sd.png', height: 21.0,),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                productDetailsDataList.ssd.toString(),
                style: extraInfoTextStyle,
              ),
            )
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/productDetails/ssd.png', height: 22.0,),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                productDetailsDataList.sd.toString(),
                style: extraInfoTextStyle,
              ),
            )
          ],
        ),
      ],
    ),
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
