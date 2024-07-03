import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/product_controller.dart';
import 'logout_confirmation_dialog.dart';
import 'product_list.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final ProductController productController = Get.find();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Show confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LogoutConfirmationDialog(); // Use the dialog widget
                },
              );
            },
          )
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ProductListScreen();
        }
      }),
    );
  }
}
