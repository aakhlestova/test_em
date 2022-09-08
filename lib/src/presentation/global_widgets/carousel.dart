import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/main_screen_model.dart';
import '../../data/models/product_details_model.dart';
import '../../domain/controllers/main_screen_controller.dart';
import '../../domain/controllers/product_details_controller.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import 'buttons.dart';


/// карусель с товарами категории Hor Sales
class HotSalesCarouselWidget extends StatefulWidget {
  const HotSalesCarouselWidget({Key? key, }) : super(key: key);

  @override
  _HotSalesCarouselWidgetState createState() => _HotSalesCarouselWidgetState();
}

class _HotSalesCarouselWidgetState extends State<HotSalesCarouselWidget> {

  final MainScreenController mainScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<HomeStore> homeStoreDataList = mainScreenController.mainScreen.value.homeStore!;
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

  const ProductPhotoCarousel({Key? key, }) : super(key: key);

  @override
  _ProductPhotoCarouselState createState() => _ProductPhotoCarouselState();
}

class _ProductPhotoCarouselState extends State<ProductPhotoCarousel> {

  final ProductDetailsController productDetailsController = Get.find();
  late PageController _pageController;
  List<String> images = [];

  int _currentIndex = 0;

  @override
  void initState() {
    ProductDetails productDetailsDataList = productDetailsController.productDetails.value;
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
