import 'package:flutter_bloc/flutter_bloc.dart';

part 'restaurantDetail_event.dart';
part 'restaurantDetail_state.dart';

// TODO ADD INTERFACES FOR THIS BLOC
class RestaurantDetailBloc extends Bloc<RestaurantDetailsEvent, RestaurantDetailState> {
  RestaurantDetailBloc()
      : super(
          RestaurantDetailInitial(
            restaurant: [],
          ),
        ) {
    on<SetCurrentRestaurant>(
      (event, emit) {
        emit(
          RestaurantDetailFetched(
            restaurant: event.restaurant,
          ),
        );
      },
    );
  }
}