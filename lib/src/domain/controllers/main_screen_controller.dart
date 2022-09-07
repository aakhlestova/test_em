import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../data/models/main_screen_model.dart';
import '../repositories/repository.dart';

class MainScreenController extends GetxController {

  var isLoading = true.obs;

  var mainScreen = MainScreen().obs;

  @override
  void onInit() {
    fetchMainScreen();
    super.onInit();
  }

  void fetchMainScreen() async {
    try {
      isLoading(true);
      var mainScreenData = await Repository.fetchMainScreenData();
      if (mainScreenData != null) {
        mainScreen.value = mainScreenData;
        print('HomeStore count is:${mainScreen.value.homeStore?.length}');
        print('BestSeller count is:${mainScreen.value.bestSeller?.length}');

      }
    }
    finally {
      isLoading(false);
    }
  }
}