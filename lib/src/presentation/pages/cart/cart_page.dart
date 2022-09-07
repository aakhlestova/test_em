import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/src/constants.dart';
import 'package:test_em/src/presentation/pages/cart/widgets/cart_header_widget.dart';
import 'package:test_em/src/presentation/pages/cart/widgets/cart_widget.dart';
import '../../../domain/controllers/cart_controller.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class CartPage extends StatelessWidget {

  final CartController cartController = Get.put(
      CartController());
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: screenBackgroundColor,
        body: Column(
          children: [
            Expanded(
              child: Obx((){
                if (cartController.isLoading.value){
                  return Center(child: CircularProgressIndicator(),);
                } else {
                  return ListView(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 37.0),
                        child: CartHeaderWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0, left: 40.0),
                        child: Text(
                          myCartText,
                          style: myCartTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: CartWidget(cartDataList: cartController.cart.value,),
                      ),
                    ],
                  );
                }
              }
              ))
          ],
        ),
      )
    );
  }
}
