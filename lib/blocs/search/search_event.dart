part of 'search_bloc.dart';

abstract class SearchEvent {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class Searching extends SearchEvent {
  final String? term;

  Searching({
    required this.term,
  });
}

class ClearSearch extends SearchEvent {
  final String? term;

  ClearSearch({
    required this.term,
  });
}
/*
abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInit extends SearchEvent {
  final String? findIn;
  SearchInit({this.findIn});
}

class Searching extends SearchEvent {
  final String? term;
  Searching({this.term});
}

class ClearSearch extends SearchEvent {}
*/
