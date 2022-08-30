import 'package:countries_app/model/countries.dart';
import 'package:countries_app/widgets/detailScreenWidgets/continent_icon.dart';
import 'package:countries_app/widgets/detailScreenWidgets/country_info.dart';
import 'package:countries_app/widgets/detailScreenWidgets/official_languages.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailScreen extends StatefulWidget {
  static const String id = '/detailScreen';
  final Country? country;
  const DetailScreen({Key? key, this.country}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screeen'), centerTitle: true),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Wrap(
              spacing: 15,
              runSpacing: 5,
              children: <Widget>[
                countryInfo(continentIcon(widget.country?.continent),
                    widget.country?.continent),
                countryInfo(Icons.phone, widget.country?.phone),
                countryInfo(MdiIcons.currencySign, widget.country?.currency),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Divider(height: 1.0),
          ),
          const SizedBox(height: 15.0),
          officialLanguages(widget.country),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
