import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  const CustomFormField(
      {super.key, required this.controller, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        // hintText: hinttext,
        labelText: hinttext,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Enter your $hinttext";
        }
        return null;
      },
    );
  }
}
