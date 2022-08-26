
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/constants.dart';
import 'package:test_em/models/main_screen_model.dart';
import 'package:test_em/views/theme/carousel.dart';

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
/*

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _getImageList(homeStoreDataList).map((e) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(e,
              width: 400,
              height: 182,
              fit: BoxFit.fitHeight,)
          ],
        ) ,
      )).toList(),
      options: CarouselOptions(
        height: 182,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),

    );
  }
}

List<String> _getImageList(List<HomeStore> homeStoreDataList){

  List<String> imageList = [];
  for (int index = 0; index < homeStoreDataList.length; index++){
    imageList.add(homeStoreDataList[index].picture.toString());
  }
  return imageList;
}
*/
