import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../theme/text_styles.dart';
import 'cart_amount_counter_widget.dart';

/// карточка товара в корзине
class CartProductWidget extends StatefulWidget {
  int index;
  String? image;
  String? title;
  int? price;
  CartProductWidget({Key? key, required this.image, required this.price, required this.title, required this.index}) : super(key: key);

  @override
  _CartProductWidgetState createState() => _CartProductWidgetState(image, title, price, index);
}

class _CartProductWidgetState extends State<CartProductWidget> {
  int index;
  String? image;
  String? title;
  int? price;
  _CartProductWidgetState(this.image, this.title, this.price, this.index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 88.0,
                  width: 88.0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage(image!),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title.toString(),
                          style: cartProductTitleTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            '\$'+ price.toString(),
                            style: cartProductPriceTextStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                CartAmountCounterWidget(index: index,),
                IconButton(
                  padding: EdgeInsets.all(0.0),
                    onPressed: () {},
                    icon: Image.asset('assets/images/cart/delete.png', height: 16.0,))
              ],
            ),
          )
        ],
      ),
    );
  }
}
