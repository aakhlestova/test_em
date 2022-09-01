import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_em/constants.dart';
import 'package:test_em/views/pages/cart/widgets/cart_amount_counter_widget.dart';
import 'package:test_em/views/theme/colors.dart';
import 'package:test_em/views/theme/text_styles.dart';

import '../../../../models/cart_model.dart';


/// виджет с итоговой информацией по заказу в корзине
class CartTotalWidget extends StatefulWidget {
  final Cart cartDataList;
  const CartTotalWidget({Key? key, required this.cartDataList}) : super(key: key);

  @override
  _CartTotalWidgetState createState() => _CartTotalWidgetState(cartDataList);
}

class _CartTotalWidgetState extends State<CartTotalWidget> {
  final Cart cartDataList;
  _CartTotalWidgetState(this.cartDataList);

  int totalPrice = 0;

  /// здесь программа работает не совсем корректно
  /// при изменении количества товаров, общая сумма totalPrice пересчитывается,
  /// но текстовый виджет, который ее отображает, не обновляется
  ///
  void _getTotalPrice(){
    setState(() {
      for (int index = 0; index < cartDataList.basket!.length; index++) {
        totalPrice = cartDataList.basket![index].price! * ProductAmount.currentAmountList[index] + totalPrice;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    _getTotalPrice();
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
                  Text(
                    '\$' + totalPrice.toString() + ' us',
                    style: cartTotalTextStyle,
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
