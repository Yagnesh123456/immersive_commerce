import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

/// RegistrationController manages the user registration form and its validation.
class RegistrationController extends GetxController {
  /// Observable for storing the user's name.
  final name = ''.obs;

  /// Observable for storing the user's email.
  final email = ''.obs;

  /// Observable for storing the user's password.
  final password = ''.obs;

  var isObscure = true.obs; // Flag to toggle password visibility

  /// GlobalKey for form validation.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Instance of AuthController to handle registration.
  final AuthController authController = Get.find();

  /// Toggles the visibility of the password field.
  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  /// Validates the user's name.
  ///
  /// Returns an error message if the name is empty, otherwise returns null.
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  /// Validates the user's email.
  ///
  /// Returns an error message if the email is empty or not valid, otherwise returns null.
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validates the password input field.
  ///
  /// Returns an error message if the field is empty or less than 6 characters, otherwise null.
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Registers a new user if the form is valid.
  ///
  /// Validates the form and then uses the AuthController to register the user.
  void register() async {
    if (formKey.currentState!.validate()) {
      // Access email.value, and password.value for user data
      print(
          'Registration with  email: ${email.value}, password: ${password.value}');
      authController.register(email.value, password.value);
    }
  }
}
