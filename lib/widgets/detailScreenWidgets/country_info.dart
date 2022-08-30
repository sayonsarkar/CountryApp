import 'package:flutter/material.dart';

Widget countryInfo(IconData icon, String? text) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(icon, size: 20),
      const SizedBox(width: 5.0),
      Text(text ?? ""),
    ],
  );
}
