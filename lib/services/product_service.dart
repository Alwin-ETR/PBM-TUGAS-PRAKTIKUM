import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';
import '../utils/constants.dart';
import 'storage_service.dart';

class ProductService {

  static Future<List<ProductModel>> getProducts() async {

  try {

    final token =
        await StorageService.getToken();

    final url = Uri.parse(
      "${Constants.baseUrl}/api/products",
    );

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    print(response.body);

    if (response.statusCode == 200) {

      final data =
          jsonDecode(response.body);

      final List products =
          data['data']['products'] ?? [];

      return products
          .map(
            (e) => ProductModel.fromJson(e),
          )
          .toList();
    }

    return [];

  } catch (e) {

    print("ERROR GET PRODUCTS: $e");

    return [];
  }
}

  static Future<bool> addProduct({
    required String name,
    required int price,
    required String description,
  }) async {

    final token = await StorageService.getToken();

    final url = Uri.parse(
      "${Constants.baseUrl}/api/products",
    );

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "price": price,
        "description": description,
      }),
    );

    return response.statusCode == 200 ||
        response.statusCode == 201;
  }

  static Future<bool> submitTask({
    required String name,
    required int price,
    required String description,
    required String githubUrl,
  }) async {

    final token = await StorageService.getToken();

    final url = Uri.parse(
      "${Constants.baseUrl}/api/products/submit",
    );

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "price": price,
        "description": description,
        "github_url": githubUrl,
      }),
    );
    print(response.body);

    return response.statusCode == 200 ||
        response.statusCode == 201;
  }
}