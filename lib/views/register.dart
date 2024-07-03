import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import '../util/input_decorations.dart';

class RegisterScreen extends GetView<RegistrationController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: TextEditingController(
                  text: controller.name.value,
                ),
                decoration: InputDecorations.inputDecoration('Name'),
                validator: controller.validateName,
                onChanged: (value) => controller.name.value = value,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: TextEditingController(
                  text: controller.email.value,
                ),
                decoration: InputDecorations.inputDecoration('Email'),
                validator: controller.validateEmail,
                onChanged: (value) => controller.email.value = value,
              ),
              const SizedBox(height: 16.0),
              Obx(
                () => TextFormField(
                  controller: TextEditingController(
                    text: controller.password.value,
                  ),
                  decoration: InputDecorations.inputDecoration(
                    'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isObscure.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                  validator: controller.validatePassword,
                  onChanged: (value) => controller.password.value = value,
                  obscureText: controller.isObscure.value,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: controller.register,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
