import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_service.dart';

/// Controller for managing product data and state
class ProductController extends GetxController {
  /// Observable list of products.
  var productList = <Product>[].obs;

  /// Observable boolean to track the loading state.
  var isLoading = true.obs;

  @override
  void onInit() {
    // Fetch the list of products when the controller is initialized.
    fetchProducts();
    super.onInit();
  }

  /// Fetches the list of products from the API service.
  /// Sets the loading state to true while fetching data and updates the product list upon success.
  /// Ensures the loading state is set to false after the fetch operation completes.
  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
