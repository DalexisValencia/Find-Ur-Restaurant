part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  final List<Dishes>? dishes;
  final double? total;
  final int? amount;
  final List<Dishes>? selecteds;
  // final List<int> dishes;
  CartInitial({
    this.dishes,
    this.total,
    this.amount,
    this.selecteds,
  });
  @override
  List<Object> get props => [
        dishes!,
        total!,
        amount!,
        selecteds!,
      ];

  @override
  String toString() =>
      'CartInitial {List of Dishes: $dishes && $total && $amount && $selecteds}';
}

class CartFetched extends CartState {
  // final List<int> dishes;
  final List<Dishes>? dishes;
  final double? total;
  final int? amount;
  // final List<Dishes>? selecteds;
  CartFetched(
    this.dishes,
    this.total,
    this.amount,
    // this.selecteds,
  );

  @override
  List<Object> get props => [
        dishes!,
        total!,
        amount!,
        // selecteds!,
      ];

  @override
  // List<Object> get props => ["esto"];

  @override
  String toString() =>
      'FetchItems {List of Dishes: Plato(s): $dishes && total: $total && cantidad: $amount && seleccionados: ??}';
}
