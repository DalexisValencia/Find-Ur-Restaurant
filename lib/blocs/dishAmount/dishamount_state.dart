part of 'dishamount_bloc.dart';

abstract class DishamountState extends Equatable {
  const DishamountState();

  @override
  List<Object> get props => [];
}

class DishamountInitial extends DishamountState {
  final int? amount;
  DishamountInitial({this.amount});

  @override
  List<Object> get props => [amount!];

  @override
  String toString() => 'DishamountInitial {Amount: $amount}';
}

class DishAmountFetched extends DishamountState {
  final int? amount;
  // final List<int> promos; this.promos
  DishAmountFetched({this.amount});

  @override
  List<Object> get props => [amount!];

  @override
  String toString() => 'DishAmountFetched {Amount: $amount}';
}
