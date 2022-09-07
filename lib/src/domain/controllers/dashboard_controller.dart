import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0;

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }
}