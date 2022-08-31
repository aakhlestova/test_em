import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/controllers/dashboard_controller.dart';
import 'package:test_em/views/pages/main_screen/main_screen_page.dart';

import '../../global_widgets/bottom_navigation_bar.dart';
import '../cart/cart_page.dart';
import '../favorites/favorites_page.dart';
import '../profile/profile_page.dart';

class DashboardPage extends StatelessWidget {

  final DashboardController dashboardController = Get.put(DashboardController());

  DashboardPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.selectedIndex,
              children: [
                MainScreenPage(),
                CartPage(),
                FavoritesPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBarWidget(),
        );
      },
    );
  }
}
