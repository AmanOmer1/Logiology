import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductDetailsController extends GetxController {
  var product = <String, dynamic>{}.obs;
  var isProductLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchingPrdctDetails();
  }

  Future<void> fetchingPrdctDetails() async {
    isProductLoading.value = true;
    try {
      final productID = Get.arguments as int?;
      if (productID != null) {
        final responseFromDummy = await http.get(
          Uri.parse('https://dummyjson.com/products/$productID'),
        );
        if (responseFromDummy.statusCode == 200) {
          product.value = jsonDecode(responseFromDummy.body);
        } else {
          Get.snackbar('Error', 'Product missing');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'No Product ID');
    } finally {
      isProductLoading.value = false;
    }
  }
}
