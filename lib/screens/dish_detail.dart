import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering/model/cart_item.dart';
import 'package:food_ordering/widgets/add_cart_navBar.dart';
import 'package:food_ordering/widgets/quantityChange.dart';
import '../model/dish.dart';
import 'package:food_ordering/provider/favorites_provider.dart';

class DishDetail extends ConsumerStatefulWidget {
  const DishDetail({super.key, required this.meal});
  final Dish meal;

  @override
  ConsumerState<DishDetail> createState() {
    return _DishDetailState();
  }
}

class _DishDetailState extends ConsumerState<DishDetail> {
  int finalQuantity = 1;
  int quantity = 1;
  late ScrollController _childScrollController;
  double currentper = 0;

  setQuantity(int quantity) {
    setState(() {
      finalQuantity = quantity;
    });

    print("final quantity${finalQuantity}");
  }

  @override
  void initState() {
    _childScrollController = ScrollController();
    _childScrollController.addListener(() {} //printcontroller(),
        );
    super.initState();
  }

  @override
  void dispose() {
    _childScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var favDishes = ref.watch(favoriteDishesNotifier);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: size.height * 0.40,
            child: Hero(
                tag: widget.meal.id,
                child: Image.network(
                  widget.meal.image,
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: IconButton(
                  icon: favDishes.contains(widget.meal)
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    ref
                        .read(favoriteDishesNotifier.notifier)
                        .toggleMealFavorite(widget.meal);
                  }),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: size.height * (0.65 + currentper),
                decoration: const BoxDecoration(
                    //boxShadow:[ BoxShadow(offset: Offset(0, 4),blurRadius: 4,color: Colors.black26)],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: SingleChildScrollView(
                  controller: _childScrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 4,
                                color: Color.fromARGB(58, 0, 0, 0))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    maxLines: 3,
                                    widget.meal.name,
                                    style: theme.textTheme.titleLarge!.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Baseline(
                                      baseline: 13,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Text(
                                        "Rating  ",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Baseline(
                                      baseline: 14,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: '${widget.meal.rating}/',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700)),
                                        const TextSpan(text: '5')
                                      ])),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Baseline(
                                      baseline: 16,
                                      baselineType: TextBaseline.alphabetic,
                                      child: SvgPicture.asset(
                                        "assets/icons/star_fill.svg",
                                        width: 20,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.timer,
                                        color: Colors.black54),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "${widget.meal.time}- ${widget.meal.time + 5} mins",
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      "Price",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "₹ ${widget.meal.price}",
                                      style: TextStyle(fontSize: 17),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              QuantityChange(
                                  setQuan: (quan) {
                                    return setQuantity(quan);
                                  },
                                  initialQuantity: 1),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.meal.description,
                          maxLines: 10,
                          style: const TextStyle(
                              fontFamily: "Bacasime Antique", fontSize: 15),
                        )
                      ],
                    ),
                  ]),
                ),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: AddCartNavBar(
                item: CartItem(
                    dish: widget.meal,
                    price: widget.meal.price,
                    quantity: finalQuantity),
              ))
        ]),
      ),
    );
  }
}
