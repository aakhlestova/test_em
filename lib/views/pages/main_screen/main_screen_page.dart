import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/controllers/main_screen_controller.dart';
import 'package:test_em/main.dart';
import 'package:test_em/models/main_screen_model.dart';
import 'package:test_em/views/pages/main_screen/widgets/home_store_widget.dart';

class MainScreenPage extends StatelessWidget {

  final MainScreenController mainScreenController = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (mainScreenController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount:
                    mainScreenController.mainScreen.value.homeStore?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: [
                            HomeStoreWidget(homeStoreDataList: mainScreenController.mainScreen.value.homeStore!,)
                            /*Text(
                                mainScreenController.mainScreen.value.homeStore![index].id.toString(),
                            ),
                            Text(
                              mainScreenController.mainScreen.value.homeStore![index].isNew.toString(),
                            ),
                            Text(
                              mainScreenController.mainScreen.value.homeStore![index].title.toString(),
                            ),
                            Text(
                              mainScreenController.mainScreen.value.homeStore![index].subtitle.toString(),
                            ),
                            Text(
                              mainScreenController.mainScreen.value.homeStore![index].isBuy.toString(),
                            ),
                            Image.network(mainScreenController.mainScreen.value.homeStore![index].picture.toString()),*/
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
        /*GetX<MainScreenController>(builder: ((controller) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.mainScreenDataList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                      "",
                    ),
                  ]
                );
              });
        }),),*/
      ),
    );
  }
}
