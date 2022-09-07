import 'package:get/get.dart';


import '../../data/models/product_details_model.dart';
import '../repositories/repository.dart';

class ProductDetailsController extends GetxController{
  var isLoading = true.obs;

  var productDetails = ProductDetails().obs;

  @override
  void onInit() {
    fetchProductDetails();
    super.onInit();
  }

  void fetchProductDetails() async {
    try {
      isLoading(true);
      var productDetailsData = await Repository.fetchProductDetailsData();
      if (productDetailsData != null) {
        productDetails.value = productDetailsData;
        print('Product details are successfully fetched!');
      }
    }
    finally {
      isLoading(false);
    }
  }
}