import 'package:get/get.dart';
import 'package:product_demo/models/prod_model.dart';
import 'package:product_demo/services/api.dart';

class Controller extends GetxController {
  late Future<Products> products;
  @override
  void onInit() {
    products = APIManager().fetchProducts();
    super.onInit();
  }
}
