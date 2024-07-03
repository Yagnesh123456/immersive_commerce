import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immersive_commerce/views/register.dart';
import '../controllers/auth_controller.dart';
import '../controllers/register_controller.dart';
import '../util/input_decorations.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecorations.inputDecoration(
                  'Email'), // Use the utility method,
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecorations.inputDecoration('Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.put(
                  RegistrationController(),
                );
                Get.to(
                  () => RegisterScreen(),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
