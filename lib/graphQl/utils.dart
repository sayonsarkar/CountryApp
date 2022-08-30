import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountriesGraphQL {
  static final CountriesGraphQL _internal = CountriesGraphQL.internal();
  factory CountriesGraphQL() => _internal;
  CountriesGraphQL.internal();

  static final HttpLink _httpLink = HttpLink(
    'https://countries.trevorblades.com/',
  );

  static final Link _link = _httpLink;

  final ValueNotifier<GraphQLClient> _client = ValueNotifier(
    GraphQLClient(
      link: _link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  ValueNotifier<GraphQLClient> get client => _client;

  String get countriesQuery {
    return '''
    query Countries {
      countries {
        emoji
        name
        continent {
          name
        }
        phone 
        currency
        languages {
          name
        }        
      }
    }
    ''';
  }
}

CountriesGraphQL countriesGraphQL = CountriesGraphQL();
