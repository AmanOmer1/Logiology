import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var productList = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchingProduct();
  }

  Future<void> fetchingProduct() async {
    try {
      final responseFromDummy = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );
      if (responseFromDummy.statusCode == 200) {
        final jsonFromDummy = jsonDecode(responseFromDummy.body);
        productList.value = List.from(jsonFromDummy['products']);
      } else {
        Get.snackbar('No Products', 'Products not available');
      }
    } catch (e) {
      Get.snackbar('ApiErorr', 'Something went wrong');
    }
  }
}
