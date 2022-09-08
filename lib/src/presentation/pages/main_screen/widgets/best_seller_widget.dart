import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/src/constants.dart';
import '../../../../data/models/main_screen_model.dart';
import '../../../../domain/controllers/main_screen_controller.dart';
import '../../../global_widgets/product_card_widget.dart';
import '../../../theme/text_styles.dart';


/// виджет с товарами бестселлерами (главная страница)
class BestSellerWidget extends StatefulWidget {
  const BestSellerWidget({Key? key,}) : super(key: key);

  @override
  _BestSellerWidgetState createState() => _BestSellerWidgetState();
}

class _BestSellerWidgetState extends State<BestSellerWidget> {

  final MainScreenController mainScreenController = Get.find();

  @override
  Widget build(BuildContext context) {

    List<BestSeller> bestSellerDataList = mainScreenController.mainScreen.value.bestSeller!;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              bestSellerHeading,
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
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 14.0,
                childAspectRatio: 1/1.5
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: bestSellerDataList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCardWidget(
                title: bestSellerDataList[index].title.toString(),
                isFavorites: bestSellerDataList[index].isFavorites!,
                picture: bestSellerDataList[index].picture.toString(),
                priceWithoutDiscount: bestSellerDataList[index].priceWithoutDiscount!,
                discountPrice: bestSellerDataList[index].discountPrice!,
              );
            }),
      ],
    );
  }
}