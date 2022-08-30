import 'package:flutter/material.dart';

Widget info({IconData? icon, String? text}) {
  Color color = Colors.grey;
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 60, color: color),
        const SizedBox(height: 5),
        Text(text ?? "", style: TextStyle(color: color))
      ],
    ),
  );
}
