// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:countries_app/graphQl/repository.dart';
import 'package:meta/meta.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  Repository repository;
  CountryBloc({required this.repository}) : super(CountryInitial()) {
    on<AppStarted>((event, emit) async {
      emit(Loading());
      var data = await repository.fetchAllCountries();

      emit(LoadCountry(countries: data));
    });
  }
}
