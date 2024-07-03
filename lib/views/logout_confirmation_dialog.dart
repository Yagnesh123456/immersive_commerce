import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import 'package:get/get.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final AuthController authController = Get.find();

   LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm Logout"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: const Text("Logout"),
          onPressed: () {
            authController.signOut(); // Call signOut method
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}
