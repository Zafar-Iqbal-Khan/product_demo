import 'package:http/http.dart' as http;
import 'package:product_demo/models/prod_model.dart';

class APIManager {
  Future<Products> fetchProducts() async {
    String url = "https://api.ertrails.in/user/newProducts";

    var response = await http.post(
      Uri.parse(url),
      body: {
        "offset": "1",
        "limit": "10",
        "comp_num": "56",
      },
    );
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    } else {
      throw (Exception);
    }
  }
}
