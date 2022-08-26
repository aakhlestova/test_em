
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/constants.dart';
import 'package:test_em/models/main_screen_model.dart';
import 'package:test_em/views/global_widgets/carousel.dart';

import '../../../theme/text_styles.dart';

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
              style: headingTextStyle,
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