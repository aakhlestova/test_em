import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/controllers/product_details_controller.dart';
import 'package:test_em/views/pages/product_details/widgets/header_widget.dart';
import 'package:test_em/views/pages/product_details/widgets/product_info_widget.dart';

import '../../global_widgets/carousel.dart';
import '../../theme/colors.dart';


/// страница определенного товара
class ProductDetailsPage extends StatelessWidget {
  final ProductDetailsController productDetailsController = Get.put(
      ProductDetailsController());

  ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: screenBackgroundColor,
          body: Column(
            children: [
              Expanded(
                  child: Obx((){
                    if (productDetailsController.isLoading.value){
                      return Center(child: CircularProgressIndicator(),);
                    } else{
                      return ListView(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 37.0),
                            child: HeaderWidget(),
                          ),
                          ProductPhotoCarousel(productDetailsDataList: productDetailsController.productDetails.value,),
                          ProductInfoWidget(productDetailsDataList: productDetailsController.productDetails.value,),
                        ],
                      );
                    }
                  }
                  )
              ),
            ],
          ),
        ),
    );
  }
}
