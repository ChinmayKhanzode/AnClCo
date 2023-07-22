import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/model/cart_item.dart';
import 'package:food_ordering/provider/cart_provider.dart';
import 'package:food_ordering/widgets/quantityChange.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  var totalItemPrice;
  var _InstructionController = TextEditingController();
  double subtotal = 0;
  double platformCharges = 5;
  double GrandTotal = 0;

  void openInstructionOverlay() {
    showModalBottomSheet(
      constraints: BoxConstraints.tight(const Size.fromHeight(400)),
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: _InstructionController,
                decoration: InputDecoration(label: Text("Enter Instructions")),
              ),
              ElevatedButton(
                  onPressed: () {
                    final Instructions = _InstructionController.text;
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"))
            ],
          ),
        );
      },
    );
  }

  void ChangeTotalItemPrice(double price) {
    setState(() {
      totalItemPrice = price;
    });
  }

  List<Widget> cartList(List<CartItem> ListCartItem) {
    List<Widget> CartDetailList = [];
    if (ListCartItem.isNotEmpty) {
      for (final item in ListCartItem) {
        totalItemPrice = item.price * item.quantity;
        subtotal += totalItemPrice;
        CartDetailList.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item.dish.name),
              Text("₹ ${item.price.toString()}")
            ]),
            Column(
              children: [
                QuantityChange(
                  setQuan: (quan) {
                    item.quantity = quan;
                    print(item.quantity);
                    if (item.quantity == 0) {
                      setState(() {
                        ref.watch(cartNotifier.notifier).removeFromCart(item);
                      });
                    }
                    setState(() {
                      subtotal = 0;
                      totalItemPrice = quan * item.price;
                    });

                    print("111${item.quantity}");
                  },
                  initialQuantity: item.quantity,
                ),
                Text("₹ ${totalItemPrice}")
              ],
            )
          ],
        ));
      }
      return CartDetailList;
    } else {
      if (ref.watch(cartNotifier).isEmpty) {
        platformCharges = 0;
      }
      return CartDetailList = [
        Container(
            height: 75, child: const Center(child: Text("No Items in Cart")))
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CartItem> CartList = ref.watch(cartNotifier);
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                ...cartList(CartList),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            return openInstructionOverlay();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Add Cooking Instructions"),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(children: [
          Expanded(
              child: Divider(
            color: Colors.grey.shade400,
            indent: 10,
            endIndent: 10,
          )),
          const Text("Bill Summary"),
          Expanded(
              child: Divider(
            color: Colors.grey.shade400,
            indent: 10,
            endIndent: 10,
          )),
        ]),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Text("Subtototal"),
                    Text("Platform Charges"),
                    Text(
                      "Grandtotal",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 70,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("₹${subtotal}"),
                    Text("₹${platformCharges}"),
                    Text(
                      "₹${subtotal + platformCharges}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ]),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
                child: Divider(
              color: Colors.grey.shade400,
              indent: 10,
              endIndent: 10,
            )),
            const Text("Cancelation Policy"),
            Expanded(
                child: Divider(
              color: Colors.grey.shade400,
              indent: 10,
              endIndent: 10,
            )),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Expanded(
                  child: Text(
                    "100% cancellation fee will be applicable if you decide to cancel the order after placement. Avoid cancellation as it leads to food wastage.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                )
              ]),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(4),
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 122, 60),
                    )),
                child: const Text(
                  "Pay",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ],
    )));
  }
}
