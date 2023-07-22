import 'package:food_ordering/model/category.dart';
import 'package:food_ordering/model/cuisine.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Dish {
  Dish(
      {required this.name,
      required this.price,
      required this.rating,
      required this.time,
      required this.image,
      required this.category,
      required this.availablity,
      required this.cuisine,
      required this.venue,
      required this.description})
      : id = uuid.v4();
  final id;
  final String name;
  final double price;
  final double rating;
  final int time;
  final String image;
  final Category category;
  final bool availablity;
  final Cuisine cuisine;
  final String venue;
  final String description;
}
