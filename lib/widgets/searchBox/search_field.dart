import 'package:flutter/material.dart';

Widget searchTextField(
    {TextEditingController? controller,
    Function(String)? textChanged,
    FocusNode? focusNode}) {
  return Expanded(
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: 'Search with Country name',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
      keyboardType: TextInputType.text,
      onChanged: (text) => textChanged!(text),
      focusNode: focusNode,
    ),
  );
}
