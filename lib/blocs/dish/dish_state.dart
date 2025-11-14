part of 'dish_bloc.dart';

abstract class DishState{
  const DishState();

  @override
  List<Object> get props => [];
}

class DishEmpty extends DishState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DishEmpty {props are empty}';
}

class DishInitial extends DishState {
  final Dishes? dish;
  DishInitial({this.dish});

  @override
  List<Object> get props => [dish!];

  @override
  String toString() => 'DishInitial {props are initial empty}';
}

class DishFetched extends DishState {
  final Dishes? dish;
  DishFetched({this.dish});

  @override
  List<Object> get props => [dish!];

  @override
  String toString() => 'DishFetched {Search by: $dish}';
}
