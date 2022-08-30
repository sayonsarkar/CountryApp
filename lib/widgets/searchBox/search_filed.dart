import 'package:countries_app/screens/search_box.dart';
import 'package:flutter/material.dart';

Widget searchField(Function(String)? onSearchTextChanged) {
  return Container(
    width: double.infinity,
    height: 38,
    margin: const EdgeInsets.all(15.0),
    child: SearchBox(textChanged: onSearchTextChanged),
  );
}
