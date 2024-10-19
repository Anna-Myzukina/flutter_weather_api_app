import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String label;
  final String? Function(String?)? validator;
  final int maxLines;

  const CustomTextFormFieldWidget({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.label,
    this.validator,
    this.maxLines = 1
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      maxLines: maxLines,
      cursorColor: const Color(0xFFa9bcfe),
      style: const TextStyle(
        color: Colors.white, 
          fontFamily: 'Poppins',
          fontSize: 22,
          fontWeight: FontWeight.bold
      ),
      decoration: InputDecoration(
        helperStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(
          color: Colors.white, 
          fontFamily: 'Poppins',
          fontSize: 22,
          fontWeight: FontWeight.bold
          ),
        floatingLabelStyle: const TextStyle(color: Colors.grey),
        contentPadding:
              const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xFFa9bcfe)
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xFFa9bcfe)
            ),
          ),
      ),
    );
  }
}
