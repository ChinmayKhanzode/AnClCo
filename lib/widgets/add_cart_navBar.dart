import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/provider/cart_provider.dart';
import '../model/cart_item.dart';

class AddCartNavBar extends ConsumerWidget {
  AddCartNavBar({super.key, required this.item});
  CartItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15, vertical: 20),
      child: ElevatedButton(
          onPressed: () {
            ref.watch(cartNotifier.notifier).onAddToCart(item);
          },
          style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(4),
              backgroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 255, 122, 60),
              )),
          child: const Text(
            "Add to Cart",
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
          )),
    );
  }
}
