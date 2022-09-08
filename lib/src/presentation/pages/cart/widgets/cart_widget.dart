import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/models/cart_model.dart';
import '../../../../domain/controllers/cart_controller.dart';
import '../../../global_widgets/buttons.dart';
import '../../../theme/colors.dart';
import 'cart_product_widget.dart';
import 'cart_total_widget.dart';


/// виджет корзины
class CartWidget extends StatefulWidget {
  const CartWidget({Key? key, }) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {

  final CartController cartController = Get.find();

  final List<int> currentAmountList = [1, 1];

  void refresh(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final List<int> productAmountList = Get.put(currentAmountList);
    Cart cartDataList = cartController.cart.value;
    refresh();

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),),
        color: blueAccentColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 33.0, right: 33.0),
            child: ListView.builder(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartDataList.basket!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 46.0),
                    child: CartProductWidget(
                      image: cartDataList.basket![index].images.toString(),
                      price: cartDataList.basket![index].price,
                      title: cartDataList.basket![index].title.toString(),
                      index: index,
                    ),
                  );
                },
              ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: CartTotalWidget(cartDataList: cartDataList,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27.0, left: 44.0, right: 44.0, bottom: 44.0
                ),
                child: CheckoutButton(),
              ),
            ],
          )

        ],
      ),
    );
  }
}
