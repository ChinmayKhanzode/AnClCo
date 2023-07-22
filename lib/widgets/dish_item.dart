import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/main.dart';
import 'package:food_ordering/model/cart_item.dart';
import 'package:food_ordering/screens/dish_detail.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/dish.dart';
import '../provider/cart_provider.dart';

class DishItem extends ConsumerWidget {
  const DishItem({super.key, required this.meal});
  final Dish meal;

  void navigationDishDetail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return DishDetail(
          meal: meal,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => navigationDishDetail(context),
      child: Card(
        elevation: 3,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 235, 234, 234),
            Color.fromARGB(255, 224, 224, 224),
            Color.fromARGB(186, 0, 0, 0)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
                child: FadeInImage(
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.image)),
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                      margin: EdgeInsets.all(3),
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(210, 166, 255, 131),
                      ),
                      child: Text(
                        meal.venue,
                        style: const TextStyle(
                            fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
                      ))),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  color: const Color.fromARGB(120, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meal.name,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                maxLines: 2,
                                style: theme.textTheme.titleMedium!.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                    fontSize: 30),
                              ),
                              Text("₹ ${meal.price.toString()}",
                                  style: theme.textTheme.titleSmall!.copyWith(
                                      color: theme.colorScheme.onPrimary,
                                      fontSize: 15))
                            ]),
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            ref.watch(cartNotifier.notifier).onAddToCart(
                                CartItem(
                                    dish: meal,
                                    price: meal.price,
                                    quantity: 1));
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add to Cart"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
