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
  final TextInputType? keyboardType;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChange,
      // cursorColor: Theme.of(context).accentColor,
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
