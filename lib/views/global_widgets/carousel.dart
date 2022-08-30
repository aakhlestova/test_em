import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/models/product_details_model.dart';
import 'package:test_em/views/global_widgets/buttons.dart';
import 'package:test_em/views/theme/colors.dart';
import 'package:test_em/views/theme/text_styles.dart';

import '../../models/main_screen_model.dart';


/// карусель с товарами категории Hor Sales
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
          return hotSalesCarouselPage(
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

Widget hotSalesCarouselPage (String title, String subtitle, String? isNew, bool? isBuy, String picture, int id) {
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


/// карусель фото со страницы товара (Product Details)
class ProductPhotoCarousel extends StatefulWidget {

  final ProductDetails productDetailsDataList;
  const ProductPhotoCarousel({Key? key, required this.productDetailsDataList}) : super(key: key);

  @override
  _ProductPhotoCarouselState createState() => _ProductPhotoCarouselState(productDetailsDataList,);
}

class _ProductPhotoCarouselState extends State<ProductPhotoCarousel> {
  final ProductDetails productDetailsDataList;
  _ProductPhotoCarouselState(this.productDetailsDataList);

  late PageController _pageController;
  List<String> images = [];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.75);
    _getImageList(productDetailsDataList, images);
    print('Images Count $images');
  }

  void _getImageList(ProductDetails productDetailsDataList, List<String> images){
    for (int count = 0; count < productDetailsDataList.images!.length; count++){
      images.add(productDetailsDataList.images![count].toString());
    }
  }


  @override
  Widget build(BuildContext context) {
   return SizedBox(
     height: 360.0,
     child: PageView.builder(
       controller: _pageController,
       pageSnapping: true,
       itemCount: images.length,
       onPageChanged: (index) {
         setState(() {
           _currentIndex = index;
         });
       },
       itemBuilder: (BuildContext context, int index) {
         //return productPhotoCarouselPage(images[index]);
         final image = images[index];
         var _scale = _currentIndex == index ? 1.0 : 0.8;
         return TweenAnimationBuilder(
             tween: Tween(begin: _scale, end: _scale),
             duration: const Duration(milliseconds: 350),
             child: Container(
               clipBehavior: Clip.none,
               margin: EdgeInsets.only(bottom: 20.0),
               decoration: BoxDecoration(
                 color: widgetBackgroundColor,
                 borderRadius: BorderRadius.circular(20),
                 boxShadow: [
                   BoxShadow(
                     offset: Offset(0, 10),
                     blurRadius: 20.0,
                     color: productPhotoShadowColor,
                   )
                 ],
                 image: DecorationImage(
                   image: NetworkImage(image), fit: BoxFit.fitWidth),
               ),
             ),
             builder: (context, double value, child) {
               return Transform.scale(
                 scale: value,
                 child: child,
               );
             });

       },
     ),
   );
  }
}
