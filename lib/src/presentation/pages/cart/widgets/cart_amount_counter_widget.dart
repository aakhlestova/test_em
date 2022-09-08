import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';



class CartAmountCounterWidget extends StatefulWidget {
  final int index;
  const CartAmountCounterWidget({Key? key, required this.index,}) : super(key: key);

  @override
  _CartAmountCounterWidgetState createState() => _CartAmountCounterWidgetState(index,);

}

/// переключатель количества в корзине
class _CartAmountCounterWidgetState extends State<CartAmountCounterWidget> {

  final int index;
  _CartAmountCounterWidgetState(this.index);

  final List<int> productAmountList = Get.find();

  int currentAmount = 1;

  void _addAmount(){
    setState(() {
      currentAmount++;
      productAmountList[index] = currentAmount;

    });
  }

  void _subtractAmount(){
    setState(() {
      currentAmount--;
      productAmountList[index] = currentAmount;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 68.0,
      width: 26.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        color: amountCounterColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
            child: GestureDetector(
              child: Icon(Icons.remove, size: 14.0, color: whiteTextColor,),
              onTap: _subtractAmount,
            ),
          ),
          Text(
            productAmountList[index].toString(),
            style: cartProductTitleTextStyle,
          ),
          SizedBox(
            height: 20.0,
            child: GestureDetector(
              child: Icon(Icons.add, size: 14.0, color: whiteTextColor,),
              onTap: _addAmount,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
}

