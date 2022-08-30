import 'package:countries_app/model/countries.dart';
import 'package:countries_app/widgets/country_tile.dart';
import 'package:countries_app/widgets/countryList/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget countriesList(countries) {
  return Expanded(
    child: countries!.isEmpty
        ? info(icon: FontAwesomeIcons.globe, text: 'No countries')
        : ListView.builder(
            itemCount: countries == null ? 0 : countries?.length,
            itemBuilder: (_, int index) {
              Country country = Country.fromMap(countries![index]);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: CountryTile(country: country),
              );
            },
          ),
  );
}
