import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final String? Function(String?)? validator;

  const FormInput({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<FormInput> createState() => _FormInput();
}

class _FormInput extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      obscureText: widget.obscureText,
      validator: widget.validator,
    );
  }
}
