import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/HomePageData.dart';
import '../widgets/bannerCarouselSlider.dart';
import '../widgets/catagories.dart';
import '../widgets/credits.dart';
import '../widgets/dish_item.dart';
import '../widgets/venues.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        // search Bar
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.search),
                Expanded(
                  child: TextField(
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    keyboardType: TextInputType.text,
                    showCursor: true,
                    decoration:
                        const InputDecoration(hintText: "Search Here ..."),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        // resturants----
        Row(children: [
          Expanded(
              child: Divider(
            color: Colors.grey.shade400,
            indent: 10,
            endIndent: 10,
          )),
          const Text("Our Venues"),
          Expanded(
              child: Divider(
            color: Colors.grey.shade400,
            indent: 10,
            endIndent: 10,
          )),
        ]),

        const VenueSelector(),

        const SizedBox(
          height: 5,
        ),

        // Explore------
        Row(children: [
          Expanded(
              child: Divider(
            color: Colors.grey.shade400,
            indent: 10,
            endIndent: 10,
          )),
          const Text("Explore"),
          Expanded(
              child: Divider(
            color: Colors.grey.shade400,
            indent: 10,
            endIndent: 10,
          )),
        ]),

        // CarouselSlider-------
        const bannerCarouselSlider(),

        const SizedBox(
          height: 10,
        ),

        // CataGories ----
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text("Whats On Your\n Mind...",
                  style: GoogleFonts.roboto(fontSize: 40))),
        ),
        Container(
          height: 200,
          child: catagories(),
        ),

        // Most liked
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Text("Most Liked !!", style: TextStyle(fontSize: 30)),
          ),
        ),
        for (final meal in mostLiked) DishItem(meal: meal),

        const Credits(),
      ]),
    );
  }
}
