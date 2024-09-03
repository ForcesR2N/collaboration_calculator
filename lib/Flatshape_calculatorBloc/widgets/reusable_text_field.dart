import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const ReusableTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
