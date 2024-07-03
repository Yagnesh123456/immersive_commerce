import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../controllers/auth_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final AuthController authController = Get.find();

  ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    product.image,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: // Favorite button with functionality
                        InkWell(
                      onTap: () => authController.toggleFavorite(product),
                      child: Obx(
                        () => Icon(authController.isFavorite(product)
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),

              // Wrap the description in a Container to control width
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
