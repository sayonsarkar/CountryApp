import 'package:countries_app/model/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget officialLanguages(Country? country) {
  Widget icon = SvgPicture.asset(
    'assets/images/language.svg',
    color: Colors.white,
    width: 20,
    height: 20,
  );

  // ignore: unnecessary_null_comparison
  country?.languages?.removeWhere((s) => s == null);
  String languages = country!.languages!.join(", ");

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        icon,
        const SizedBox(width: 5.0),
        Text(languages),
      ],
    ),
  );
}
