import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.controller,
    required this.label,
    this.onChange,
    this.validator,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String label;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      validator: validator,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        border: Theme.of(context).inputDecorationTheme.border,
        label: Text(
          label,
        ),
      ),
    );
  }
}
