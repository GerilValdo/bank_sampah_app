import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    required this.label,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String label;
  final bool obscureText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.035,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: height * 0.01),
        TextFormField(
          validator: validator,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: width * 0.035),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Icon(prefixIcon, color: Color(0xFF00BC7D)),
            ),
            visualDensity: VisualDensity.compact,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color(0xFFA4F4CF),
                width: 1.5,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color(0xFFA4F4CF),
                width: 1.5,
              ),
            ),
            filled: true,
            fillColor: const Color(0xFFF9F9F9),
          ),
        ),
      ],
    );
  }
}
