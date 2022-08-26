import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/constants.dart';
import 'package:test_em/views/global_widgets/buttons.dart';
import 'package:test_em/views/theme/colors.dart';
import 'package:test_em/views/theme/text_styles.dart';

import '../../models/main_screen_model.dart';

class HotSalesCarouselWidget extends StatefulWidget {
  final List<HomeStore> homeStoreDataList;
  const HotSalesCarouselWidget({Key? key, required this.homeStoreDataList}) : super(key: key);

  @override
  _HotSalesCarouselWidgetState createState() => _HotSalesCarouselWidgetState(homeStoreDataList: homeStoreDataList);
}

class _HotSalesCarouselWidgetState extends State<HotSalesCarouselWidget> {
  final List<HomeStore> homeStoreDataList;
  _HotSalesCarouselWidgetState({required this.homeStoreDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182.0,
      child: PageView.builder(
        itemCount: homeStoreDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return carouselPage(
            homeStoreDataList[index].title.toString(),
            homeStoreDataList[index].subtitle.toString(),
            homeStoreDataList[index].isNew.toString(),
            homeStoreDataList[index].isBuy,
            homeStoreDataList[index].picture.toString(),
            homeStoreDataList[index].id!,
          );
        },
      ),
    );
  }
}


Widget carouselPage (String title, String subtitle, String? isNew, bool? isBuy, String picture, int id) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), 
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(picture),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  child:
                    isNew == 'true' ?
                    Image.asset('assets/images/home/new_icon.png', height: 27.0,)
                        : null
                ),
              ),
              Text(
                title,
                style: carouselTitleTextStyle,
              ),
              Text(
                subtitle,
                style: carouselSubtitleTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Container(
                  child:
                    isBuy! ? CarouselButton() : null
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

