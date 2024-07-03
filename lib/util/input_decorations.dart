import 'package:flutter/material.dart';

/// Utility class for defining input decorations for form fields.
class InputDecorations {
  /// Returns an InputDecoration with specified label text and optional suffix icon.
  ///
  /// This method sets common styles for the input field, including padding, borders,
  /// and label text. The optional [suffixIcon] can be used to add an icon at the end
  /// of the input field.
  static InputDecoration inputDecoration(String labelText,
      {Widget? suffixIcon}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      focusedBorder: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      labelText: labelText,
      suffixIcon: suffixIcon,
    );
  }
}
