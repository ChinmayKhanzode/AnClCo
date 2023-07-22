import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/provider/favorites_provider.dart';
import 'package:food_ordering/widgets/dish_item.dart';

class FavoriteDishesScreen extends ConsumerWidget {
  const FavoriteDishesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favDishes = ref.watch(favoriteDishesNotifier);
    Widget content = const Center(child: Text("Opps No Favorites Here .."));
    if (favDishes.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My Favorites",
              style: TextStyle(fontSize: 15),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favDishes.length,
                itemBuilder: (context, index) {
                  return DishItem(
                    meal: favDishes[index],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(body: content);
  }
}
