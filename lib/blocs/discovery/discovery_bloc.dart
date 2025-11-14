import 'package:bloc/bloc.dart';
import 'package:restaurants/Lists/menu.dart';
import 'package:restaurants/interfaces/Discovery.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/interfaces/Restaurants.dart';

part 'discovery_event.dart';
part 'discovery_state.dart';

class DiscoveryBloc extends Bloc<DiscoveryEvent, DiscoveryState> {
  DiscoveryBloc()
      : super(
          DiscoveryInitial(),
        ) {
    on<DiscoveryStart>(
      (event, emit) {
        Discovery discoveryResult = completeDiscovery(event.category);
        emit(DiscoveryFetched(discovery: discoveryResult));
      },
    );
  }
}

completeDiscovery(name) {
  List<Dishes> platos = dishes.where((dish) {
    return dish.category!.indexOf(name) != -1;
  }).toList();

  List<Restaurants> resta = restaurants.where((item) {
    return item.categories!.indexOf(name) != -1;
  }).toList();
  Discovery discoveryView = Discovery(
    name: name,
    near: platos,
    newLaunch: dishes,
    restaurants: resta,
  );

  return discoveryView;
}