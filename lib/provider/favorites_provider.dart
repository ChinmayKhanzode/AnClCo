import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/model/dish.dart';

class FavoriteDishesNotifier extends StateNotifier<List<Dish>> {
  FavoriteDishesNotifier() : super([]);

  void toggleMealFavorite(Dish meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteDishesNotifier =
    StateNotifierProvider<FavoriteDishesNotifier, List<Dish>>(
        (ref) => FavoriteDishesNotifier());
