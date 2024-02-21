import 'package:flutter/material.dart';

class AuthInputWidget extends StatelessWidget {
  const AuthInputWidget(
      {Key? key,
      required this.controller,
      this.hint,
      this.icon,
      this.readOnly = false, this.OnTap})
      : super(key: key);
  final TextEditingController controller;
  final String? hint;
  final IconData? icon;
  final bool readOnly;

  final VoidCallback? OnTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: OnTap,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        hintText: hint,
        prefixIcon: Icon(icon),
        fillColor: Colors.grey,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        filled: true,
      ),
    );
  }
}
