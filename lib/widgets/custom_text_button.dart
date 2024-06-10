import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final Function()? onPresed;
  const CustomTextButton({super.key, required this.label, this.onPresed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPresed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
    );
  }
}
