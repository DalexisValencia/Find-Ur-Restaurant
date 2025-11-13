part of 'discovery_bloc.dart';

abstract class DiscoveryState {
  const DiscoveryState();

  @override
  List<Object> get props => [];
}

class DiscoveryInitial extends DiscoveryState {}

class DiscoveryFetched extends DiscoveryState {
  final Discovery? discovery; // no es un string es la interface de discovery
  DiscoveryFetched({this.discovery});

  @override
  List<Object> get props => [discovery!];

  @override
  String toString() => 'DiscoveryCurrent { Search by : $discovery}';
}
