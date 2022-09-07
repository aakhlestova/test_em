import 'package:get/get.dart';

import '../../data/models/cart_model.dart';
import '../repositories/repository.dart';

class CartController extends GetxController{
  var isLoading = true.obs;

  var cart = Cart().obs;

  @override
  void onInit() {
    fetchProductDetails();
    super.onInit();
  }

  void fetchProductDetails() async {
    try {
      isLoading(true);
      var cartData = await Repository.fetchCartData();
      if (cartData != null) {
        cart.value = cartData;
        print('Cart is successfully fetched!');
      }
    }
    finally {
      isLoading(false);
    }
  }
}