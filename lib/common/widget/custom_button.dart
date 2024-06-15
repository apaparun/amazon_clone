import 'package:amazon_clone/Constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton(
      {super.key, required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: color ?? GlobalVariables.secondaryColor,
          minimumSize: const Size(double.infinity, 50)),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, color: color == null ? Colors.white : Colors.black),
      ),
    );
  }
}
