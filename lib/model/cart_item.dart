import 'package:food_ordering/model/dish.dart';

class CartItem {
  CartItem({required this.dish, required this.price, required this.quantity});
  final Dish dish;
  final double price;
  int quantity;
}
