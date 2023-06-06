import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
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
