part of 'country_bloc.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}

class Loading extends CountryState {}

class LoadCountry extends CountryState {
  final List<Map<String, dynamic>>? countries;
  LoadCountry({required this.countries});
}
