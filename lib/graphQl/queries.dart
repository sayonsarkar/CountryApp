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
