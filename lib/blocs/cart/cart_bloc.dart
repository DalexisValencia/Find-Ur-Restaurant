import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/interfaces/aditional.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(
          CartInitial(
            dishes: [],
            total: 0,
            amount: 0,
            selecteds: [],
          ),
        ) {
    List<Dishes> stateDishesCart = state.props[0] as List<Dishes>;
    on<AddToCart>(
      (event, emit) {
        List<Dishes> finaldishes = List.from(stateDishesCart)
          ..add(
            generateNewDish(event.dish!),
          );

        emit(
          CartFetched(
            dishes: finaldishes,
            total: _getTodal(finaldishes),
            amount: _getAmountTotal(finaldishes),
            selecteds: [],
          ),
        );
      },
    );
    on<DeleteFromCart>(
      (event, emit) {
        List<Dishes> finaldishes = List.from(stateDishesCart);
        if (event.toDelete!.length >= 1) {
          stateDishesCart.asMap().entries.map((e) {
            if (event.toDelete!.contains(e.key)) {
              finaldishes.removeAt(e.key);
            }
          }).toList();
        }
        // Cuando solo sea uno
        else if (event.toDelete!.length == 1) {
          finaldishes.removeAt(0);
        }
        emit(
          CartFetched(
            dishes: finaldishes,
            total: 0,
            amount: _getAmountTotal(finaldishes),
            selecteds: [],
          ),
        );
      },
    );
    on<UpdateAmount>(
      (event, emit) {
        int amountCurrent = event.dish!.amount!;
        int indexFound = stateDishesCart.indexOf((event.dish!));
        switch (event.action) {
          case 'add':
            amountCurrent += 1;
            break;
          case 'remove':
            amountCurrent = amountCurrent > 0 ? amountCurrent - 1 : 1;
            break;
          default:
        }
        event.dish!.amount = amountCurrent;
        Dishes currentPlate = event.dish!.copyWith(
          generateNewDish(event.dish!),
        );
        List<Dishes> copyListDishes = List.from(stateDishesCart)
          ..removeAt(indexFound);
        List<Dishes> finaldishes = List.from(copyListDishes)
          ..insert(indexFound, currentPlate);

        emit(
          CartFetched(
            dishes: finaldishes,
            total: _getTodal(finaldishes),
            amount: _getAmountTotal(finaldishes),
            selecteds: [],
          ),
        );
      },
    );
  }
}

double _getTodal(List<Dishes> cartiItems) {
  double total = 0;
  cartiItems.map((e) {
    total += e.finalPrice!;
  }).toList();
  return total;
}

int _getAmountTotal(List<Dishes> cartiItems) {
  int amount = 0;
  cartiItems.map((e) {
    amount += e.amount!;
  }).toList();
  return amount;
}

double _getAdditionalPrice(Dishes dish) {
  double addtionalPrices = 0;
  if (dish.additions!.isNotEmpty) {
    dish.additions!.map((e) {
      Iterable<AditionalsOptions> additioonals =
          e.children!.where((element) => element.isActive == true);
      if (additioonals.isNotEmpty) {
        for (var aditional in additioonals) {
          addtionalPrices += aditional.price!;
        }
      }
    }).toList();
  }
  return addtionalPrices;
}

int _getPromotionlaPrices(Dishes dish, int amount) {
  int promotionPrices = 0;
  if (dish.promotionLabel!.pricePromotions!.isNotEmpty) {
    Iterable<PricePromotions> promotionsPrice = dish
        .promotionLabel!.pricePromotions!
        .where((element) => element.amount == amount);
    if (promotionsPrice.isNotEmpty) {
      promotionPrices = promotionsPrice.first.price!;
    }
  }
  return promotionPrices;
}

Dishes generateNewDish(Dishes dish) {
  int amountCurrent = dish.amount!;
  int promocionalPrice = _getPromotionlaPrices(dish, amountCurrent);
  int pricePerAmount = dish.price!.toInt() * amountCurrent;
  int discount =
      promocionalPrice == 0 ? 0 : promocionalPrice - (pricePerAmount);
  dish.finalPrice =
      (promocionalPrice == 0 ? pricePerAmount : promocionalPrice) +
          _getAdditionalPrice(dish);
  dish.promotionLabel!.discounts = discount.toDouble().abs();
  Dishes finalDish = Dishes().copyWith(dish);
  return finalDish;
}
