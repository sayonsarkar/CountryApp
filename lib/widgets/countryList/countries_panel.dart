import 'package:countries_app/bloc/bloc/country_bloc.dart';
import 'package:countries_app/widgets/countryList/country_list.dart';
import 'package:countries_app/widgets/searchBox/search_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesPanel extends StatefulWidget {
  const CountriesPanel({Key? key}) : super(key: key);

  @override
  State<CountriesPanel> createState() => _CountriesPanelState();
}

class _CountriesPanelState extends State<CountriesPanel> {
  List<Map<String, dynamic>>? allCountries;
  List<Map<String, dynamic>>? countries;

  @override
  void initState() {
    super.initState();
    context.read<CountryBloc>().add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryBloc, CountryState>(
      listener: (context, state) {
        if (state is LoadCountry) {
          countries = state.countries;
          allCountries = state.countries;
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadCountry) {
          return Column(
            children: <Widget>[
              searchField(onSearchTextChanged),
              countriesList(countries),
            ],
          );
        }
        return Container();
      },
    );
  }

  void onSearchTextChanged(String text) {
    setState(() {
      if (text.isEmpty) countries = allCountries;

      countries = allCountries?.where((c) {
        String country = (c['name'] as String).toLowerCase();
        String filter = text.toLowerCase();
        return country.contains(filter);
      }).toList();
    });
  }
}
