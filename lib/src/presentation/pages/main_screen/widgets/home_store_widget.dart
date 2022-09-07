
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/src/constants.dart';

import '../../../../data/models/main_screen_model.dart';
import '../../../global_widgets/carousel.dart';
import '../../../theme/text_styles.dart';


/// виджет с каруселью товаров категории Hot Sales (главная страница)
class HomeStoreWidget extends StatefulWidget {
  final List<HomeStore> homeStoreDataList;
  HomeStoreWidget({Key? key, required this.homeStoreDataList}) : super(key: key);

  @override
  _HomeStoreWidgetState createState() => _HomeStoreWidgetState(homeStoreDataList);
}

class _HomeStoreWidgetState extends State<HomeStoreWidget> {
  final List<HomeStore> homeStoreDataList;

  _HomeStoreWidgetState(this.homeStoreDataList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hotSalesHeading,
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
        HotSalesCarouselWidget(homeStoreDataList: homeStoreDataList,)
      ],
    );
  }
}