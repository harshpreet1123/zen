import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final Function()? onPressd;
  const CustomElevatedButton({super.key, required this.label, this.onPressd});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressd,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          minimumSize: Size(MediaQuery.of(context).size.width, 52),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
    );
  }
}
