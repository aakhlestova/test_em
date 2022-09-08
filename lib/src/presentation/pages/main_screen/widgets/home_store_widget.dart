
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/src/constants.dart';

import '../../../global_widgets/carousel.dart';
import '../../../theme/text_styles.dart';


/// виджет с каруселью товаров категории Hot Sales (главная страница)
class HomeStoreWidget extends StatefulWidget {

  HomeStoreWidget({Key? key, }) : super(key: key);

  @override
  _HomeStoreWidgetState createState() => _HomeStoreWidgetState();
}

class _HomeStoreWidgetState extends State<HomeStoreWidget> {

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
        HotSalesCarouselWidget()
      ],
    );
  }
}