import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink('https://countries.trevorblades.com/');

GraphQLClient clientToQuery() {
  return GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: HiveStore()),
  );
}
