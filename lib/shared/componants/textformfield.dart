import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.onChange,
    this.obscureText = false,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.suffixOnPressed,
  });
  final IconData? suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final String hintText;
  final void Function(String) onChange;
  final Function()? suffixOnPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'FIELD IS EMPTY';
        }
        return null;
      },
      onChanged: onChange,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixOnPressed,
                icon: Icon(
                  suffixIcon,
                  size: 30,
                ),
              )
            : null,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal),
          borderRadius: BorderRadius.circular(10),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
