part of 'restaurantDetail_bloc.dart';

abstract class RestaurantDetailsEvent {
  const RestaurantDetailsEvent();

  @override
  List<Object> get props => [];
}

class SetCurrentRestaurant extends RestaurantDetailsEvent {
  // final CommentsInterface comment;
  final restaurant;
  SetCurrentRestaurant({
    required this.restaurant,
  });
}