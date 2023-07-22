import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/model/cart_item.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void removeFromCart(CartItem Item) {
    var inddx = state.indexOf(Item);
    if (state.contains(Item)) {
      state = state.where((element) => element.dish != Item.dish).toList();
    }
  }

  void onAddToCart(CartItem Item) {
    if (state.isEmpty) {
      state = [...state, Item];
      return;
    }
    var alreadythere = false;
    for (var i = 0; i < state.length; i++) {
      if (state[i].dish == Item.dish) {
        alreadythere = true;
      }
    }

    if (alreadythere) {
      var inddx = state
          .indexOf(state.firstWhere((element) => Item.dish == element.dish));
      if (state[inddx].quantity == Item.quantity) {
        // if item already there and also same quantity
        print("Item already in cart");
        return;
      }
      removeFromCart(state[inddx]);
      state = [...state, Item];
    } else {
      state = [...state, Item];
      print("#####");
      print(Item.quantity);
    }
  }
}

final cartNotifier = StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier());
