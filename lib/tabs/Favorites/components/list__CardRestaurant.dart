import 'package:restaurants/blocs/restaurantDetail/restaurantDetail_bloc.dart';
import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/widgets/restaurantCard/normal/restaurantCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteListCardRestaurant extends StatelessWidget {
  final Restaurants? restaurant;
  final bool? selected;
  FavoriteListCardRestaurant({
    this.restaurant,
    this.selected,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantDetailBloc>(
      create: (BuildContext context) => RestaurantDetailBloc(),
      child: HightlightResturantsCard(
        hightlight: restaurant!,
        selected: selected!,
        favorite: false,
      ),
    );
  }
}
