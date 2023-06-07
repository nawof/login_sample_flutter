import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.controller,
    required this.label,
    this.onChange,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final String label;
  final void Function(String)? onChange;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
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
