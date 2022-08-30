import 'package:countries_app/model/countries.dart';
import 'package:countries_app/screens/details_screen.dart';
import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  final Country? country;

  const CountryTile({Key? key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                country: country,
              ),
            ),
          );
        },
        leading:
            Text(country?.emoji ?? "", style: const TextStyle(fontSize: 24)),
        title: Text(country?.name ?? ""),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
