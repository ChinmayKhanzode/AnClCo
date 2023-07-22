import 'package:flutter/material.dart';
import 'package:food_ordering/data/catagoriesData.dart';
import 'package:food_ordering/data/menu.dart';
import 'package:food_ordering/screens/list_items.dart';

import '../model/category.dart';
import '../model/dish.dart';

class catagories extends StatelessWidget {
  const catagories({super.key});

  void FilterCatagoryList(Category category, BuildContext context) {
    List<Dish> categoryList =
        menuData.where((element) => element.category == category).toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ListItems(
          FilteredListDishes: categoryList, FilteredListCuisines: null),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2),
      children: [
        for (final catagarie in CatagoriesData)
          GestureDetector(
            onTap: () => FilterCatagoryList(catagarie, context),
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Image.network(
                      catagarie.imgurl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Text(catagarie.title),
              ],
            )),
          )
      ],
    );
  }
}
