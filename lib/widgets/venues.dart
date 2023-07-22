import 'package:flutter/material.dart';
import 'package:food_ordering/data/cuisineData.dart';
import 'package:food_ordering/data/menu.dart';
import 'package:food_ordering/model/cuisine.dart';
import 'package:food_ordering/screens/list_items.dart';

import '../main.dart';
import '../model/dish.dart';

class VenueSelector extends StatelessWidget {
  const VenueSelector({super.key});

  void _FilterList(String venue, BuildContext context) {
    final List<Dish> listDishes =
        menuData.where((element) => element.venue == venue).toList();

    final List<Cuisine> listCuisines = cuisineData
        .where(
          (element) => element.venue == venue,
        )
        .toList();
    _ShowList(listDishes, listCuisines, context);
  }

  void _ShowList(listDishes, listCuisines, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return ListItems(
          FilteredListCuisines: listCuisines,
          FilteredListDishes: listDishes,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              child: InkWell(
                splashColor: Theme.of(context).splashColor,
                child: Container(
                  width: 100,
                  height: 75,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(211, 255, 119, 0),
                        Colors.amber
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(100, 60))),
                  child: Center(
                    child: Text("Anticlock",
                        style: theme.textTheme.titleMedium!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                onTap: () {
                  return _FilterList("Anticlock", context);
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              splashColor: theme.colorScheme.background,
              child: Container(
                width: 100,
                height: 75,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(211, 255, 119, 0),
                      Colors.amber
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.all(Radius.elliptical(100, 60))),
                child: Center(
                  child: Text("ClockWise",
                      style: theme.textTheme.titleMedium!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              onTap: () {
                return _FilterList("Clockwise", context);
              },
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            splashColor: theme.colorScheme.background,
            child: Container(
              width: 100,
              height: 75,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color.fromARGB(211, 255, 119, 0), Colors.amber],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.all(Radius.elliptical(100, 60))),
              child: Center(
                child: Text("Container",
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            onTap: () {
              return _FilterList("Container", context);
            },
          ),
        ]),
      ],
    );
  }
}
