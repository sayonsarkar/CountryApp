import 'package:flutter/material.dart';

Widget cancelButton({required bool canCancel, Function()? onCancel}) {
  return Visibility(
    visible: canCancel,
    child: Container(
      margin: const EdgeInsets.only(left: 8),
      child: GestureDetector(
        onTap: onCancel,
        child: const Icon(Icons.cancel, color: Colors.tealAccent, size: 30),
      ),
    ),
  );
}
