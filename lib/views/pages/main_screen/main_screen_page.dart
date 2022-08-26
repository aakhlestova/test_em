import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:test_em/controllers/main_screen_controller.dart';
import 'package:test_em/views/pages/main_screen/widgets/best_seller_widget.dart';
import 'package:test_em/views/pages/main_screen/widgets/home_store_widget.dart';
import 'package:test_em/views/pages/main_screen/widgets/search_widget.dart';
import 'package:test_em/views/pages/main_screen/widgets/select_category_widget.dart';
import 'package:test_em/views/theme/colors.dart';
import 'package:test_em/views/theme/text_styles.dart';

class MainScreenPage extends StatelessWidget {

  final MainScreenController mainScreenController = Get.put(
      MainScreenController());

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: screenBackgroundColor,
          appBar: ScrollAppBar(
            controller: controller,
            backgroundColor: screenBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/appBar/location.png', width: 12.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0, right: 8.0),
                    child: Text(
                      "Zihuatanejo, Gro",
                      style: locationTextStyle,
                    ),
                  ),
                  Image.asset(
                    'assets/images/appBar/arrow_down.png', height: 5.0,),
                ],
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/appBar/filter.png', height: 13.0,))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Obx((){
                  if (mainScreenController.isLoading.value){
                    return Center(child: CircularProgressIndicator(),);
                  } else{
                    return ListView(
                      controller: controller,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 22.0),
                          child: Column(
                            children: [
                              SelectCategoryWidget(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 24.0,
                                    left: 32.0,
                                    right: 37.0
                                ),
                                child: SearchWidget(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: HomeStoreWidget(homeStoreDataList: mainScreenController.mainScreen.value.homeStore!,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 11.0),
                                child: BestSellerWidget(bestSellerDataList: mainScreenController.mainScreen.value.bestSeller!,),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }
                }
                )
              ),
            ],
          ),
        )
    );
  }
}
