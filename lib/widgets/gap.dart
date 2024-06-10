import 'package:flutter/material.dart';

class HGap extends StatelessWidget {
  final double? height;
  const HGap({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20,
    );
  }
}

class WGap extends StatelessWidget {
  final double? width;
  const WGap({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 20,
    );
  }
}
