import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

IconData continentIcon(String? continent) {
  if (continent == "Africa") {
    return FontAwesomeIcons.earthAfrica;
  } else if (continent == "Asia" || continent == "Oceania") {
    return FontAwesomeIcons.earthAsia;
  } else if (continent == "Europe") {
    return FontAwesomeIcons.earthEurope;
  } else if (continent == "North America" || continent == "South America") {
    return FontAwesomeIcons.earthAmericas;
  } else {
    return MdiIcons.earth;
  }
}
