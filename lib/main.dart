import 'package:countries_app/bloc/bloc/country_bloc.dart';
import 'package:countries_app/screens/details_screen.dart';
import 'package:countries_app/graphQl/repository.dart';
import 'package:countries_app/graphQl/utils.dart';
import 'package:countries_app/widgets/countryList/countries_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(CountriesApp(client: countriesGraphQL.client));
}

class CountriesApp extends StatelessWidget {
  final Repository repository = Repository();
  final ValueNotifier<GraphQLClient> client;

  CountriesApp({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryBloc>(
            create: (context) => CountryBloc(repository: repository))
      ],
      child: MaterialApp(
        routes: {
          DetailScreen.id: (context) => const DetailScreen(),
        },
        title: 'Countries',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(title: const Text('Countries'), centerTitle: true),
          body: BlocBuilder<CountryBloc, CountryState>(
            builder: (context, state) {
              return const CountriesPanel();
            },
          ),
        ),
      ),
    );
  }
}
