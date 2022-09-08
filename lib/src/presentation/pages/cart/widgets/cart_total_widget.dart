import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_em/src/constants.dart';

import '../../../../data/models/cart_model.dart';
import '../../../../domain/controllers/cart_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';
import 'cart_amount_counter_widget.dart';

/// виджет с итоговой информацией по заказу в корзине
class CartTotalWidget extends StatefulWidget {
  final Cart cartDataList;
  const CartTotalWidget({Key? key, required this.cartDataList}) : super(key: key);

  @override
  _CartTotalWidgetState createState() => _CartTotalWidgetState();
}

class _CartTotalWidgetState extends State<CartTotalWidget> {

  final CartController cartController = Get.find();
  final List<int> productAmountList = Get.find();

  final ValueNotifier<String> _notify = ValueNotifier<String>('0');

  int totalPrice = 0;

  /// здесь программа работает не совсем корректно
  /// при изменении количества товаров, общая сумма totalPrice пересчитывается,
  /// но текстовый виджет, который ее отображает, не обновляется
  ///
  void _getTotalPrice(Cart cartDataList){
    setState(() {
      for (int index = 0; index < cartDataList.basket!.length; index++) {
        int length = cartDataList.basket!.length;
        print(length);
        print('SUM + $productAmountList');
        totalPrice = cartDataList.basket![index].price! * productAmountList[index] + totalPrice;
        _notify.value = totalPrice.toString();

      }
    });

  }

  @override
  Widget build(BuildContext context) {
    totalPrice = 0;
    Cart cartDataList = cartController.cart.value;
    _getTotalPrice(cartDataList);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 91.0,
      decoration: BoxDecoration(
        color: blueAccentColor,
        border: Border.symmetric(horizontal: BorderSide(
          style: BorderStyle.solid,
          color: whiteBorderColor,
          width: 1.0
        )),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  totalPriceText,
                  style: cartTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    deliveryText,
                    style: cartTextStyle,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _notify,
                    builder: ( context,  value,  child){
                      return Text(
                        '\$$value us',
                        style: cartTotalTextStyle,
                      );
                    }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      cartDataList.delivery.toString(),
                      style: cartTotalTextStyle,
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
