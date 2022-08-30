import 'package:countries_app/widgets/searchBox/cancel_button.dart';
import 'package:countries_app/widgets/searchBox/search_field.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final Function(String)? textChanged;

  const SearchBox({Key? key, this.textChanged}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController? controller;
  FocusNode? focusNode;
  bool canCancel = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode()..addListener(focusListener);
  }

  void focusListener() => setState(() => canCancel = focusNode!.hasFocus);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        searchTextField(
          controller: controller,
          textChanged: widget.textChanged,
          focusNode: focusNode,
        ),
        cancelButton(canCancel: canCancel, onCancel: onCancel),
      ],
    );
  }

  void onCancel() {
    if (controller!.text.isEmpty) focusNode?.unfocus();
    widget.textChanged!('');
    controller?.text = '';
  }

  @override
  void dispose() {
    controller?.dispose();
    focusNode?.dispose();
    super.dispose();
  }
}
