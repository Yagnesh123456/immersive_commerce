import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

/// Service class for API calls related to products
class ApiService {
  /// HTTP client for making requests.
  static var client = http.Client();

  /// Fetches the list of products from the API.
  /// Makes a GET request to the specified endpoint and parses the JSON response.
  /// Returns a list of Product objects if the request is successful.
  /// Throws an exception if the request fails.
  static Future<List<Product>> fetchProducts() async {
    var response =
        await client.get(Uri.parse('https://fakestoreapi.com/products'));
    // Check if the response status code is 200 (OK)
    if (response.statusCode == 200) {
      // Parse the response body as a JSON string
      var jsonString = response.body;

      // Decode the JSON string into a List of dynamic objects
      var jsonMap = json.decode(jsonString) as List;

      // Convert the List of dynamic objects to a List of Product objects
      return jsonMap.map((json) => Product.fromJson(json)).toList();
    } else {
      // Throw an exception if the request failed
      throw Exception('Failed to load products');
    }
  }
}
