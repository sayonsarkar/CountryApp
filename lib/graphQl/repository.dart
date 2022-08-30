import 'package:countries_app/graphQl/connections.dart';
import 'package:countries_app/graphQl/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Repository {
  final GraphQLClient _client = clientToQuery();

  Future<List<Map<String, dynamic>>?> fetchAllCountries() async {
    QueryResult result =
        await _client.query(QueryOptions(document: gql(countriesQuery)));

    if (!result.hasException) {
      List<Map<String, dynamic>> data =
          (result.data!['countries'] as List<dynamic>)
              .cast<Map<String, dynamic>>();

      List<Map<String, dynamic>> countries = [];
      countries = data;
      return countries;
    }
    return null;
  }
}
