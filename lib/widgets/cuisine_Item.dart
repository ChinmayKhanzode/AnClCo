import 'package:flutter/material.dart';
import 'package:food_ordering/screens/list_items.dart';
import 'package:transparent_image/transparent_image.dart';
import '../main.dart';
import '../model/cuisine.dart';
import '../model/dish.dart';

class CuisineItem extends StatelessWidget {
  const CuisineItem(
      {super.key, required this.cuisine, required this.ListDishes});
  final Cuisine cuisine;
  final List<Dish> ListDishes;

  void onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          ListItems(FilteredListDishes: ListDishes, FilteredListCuisines: null),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
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
              FadeInImage(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(cuisine.image)),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    color: const Color.fromARGB(120, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cuisine.title,
                                style: theme.textTheme.titleMedium!.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                    fontSize: 30),
                              ),
                            ]),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
