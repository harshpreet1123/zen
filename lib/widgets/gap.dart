import 'package:flutter/material.dart';

Widget hGap({double? h}){
  return SizedBox(
      height: h ?? 20,
    );
}

Widget wGap({double? w}){
  return SizedBox(
      width: w ?? 20,
    );
}
