part of 'restaurantDetail_bloc.dart';

abstract class RestaurantDetailState {
  const RestaurantDetailState();

  @override
  List<Object> get props => [];
}

class RestaurantDetailInitial extends RestaurantDetailState {
  final restaurant;

  RestaurantDetailInitial({
    required this.restaurant,
  });

  @override
  List<Object> get props => [restaurant];
  @override
  String toString() => 'RestaurantDetailFetched {props: products: $restaurant}';
}

class RestaurantDetailFetched extends RestaurantDetailState {
  final restaurant;

  RestaurantDetailFetched({
    required this.restaurant,
  });

  @override
  List<Object> get props => [restaurant];

  @override
  String toString() => 'RestaurantDetailFetched {props: products: $restaurant}';
}

