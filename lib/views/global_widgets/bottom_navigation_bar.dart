import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_em/views/theme/colors.dart';

import '../../controllers/dashboard_controller.dart';

/// виджет навигации
class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: ($) => ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: blueAccentColor,
              icon: Image.asset('assets/images/bottomNavBar/explorer.png', height: 18.0,),
              label: 'Explorer'
            ),
            BottomNavigationBarItem(
                backgroundColor: blueAccentColor,
              icon: Image.asset('assets/images/bottomNavBar/cart.png', height: 18.0,),
              label: 'Cart'
            ),
            BottomNavigationBarItem(
                backgroundColor: blueAccentColor,
              icon: Image.asset('assets/images/bottomNavBar/favorite.png', height: 18.0,),
              label: 'Favorites'
            ),
            BottomNavigationBarItem(
                backgroundColor: blueAccentColor,
              icon: Image.asset('assets/images/bottomNavBar/profile.png', height: 18.0,),
              label: 'Profile'
            ),
          ],
          elevation: 0,
          currentIndex: $.selectedIndex,
          onTap: (index) => $.changeSelectedIndex(index),
        ),
      ),
    );
  }
}
