import 'package:flutter/material.dart';
import 'package:food_ordering/screens/cart_screen.dart';
import 'package:food_ordering/screens/favorite_dishes.dart';
import 'package:food_ordering/screens/home.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  var _SelectedPageIndex = 0;

  void selectPage(index) {
    setState(() {
      _SelectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    //page 0
    if (_SelectedPageIndex == 0) {
      content = HomeScreen();
      //page0
    } else {
      if (_SelectedPageIndex == 1) {
        content = CartScreen();
      } else {
        content = Center(child: Text("User Profile to be added"));
      }
    }

    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(211, 255, 119, 0), Colors.amber],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "AnClCo",
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteDishesScreen(),
                      ));
                },
                icon: Icon(Icons.favorite))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _SelectedPageIndex,
            onTap: (index) {
              print(index);
              return selectPage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: "Bag"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "You")
            ],
            fixedColor: Theme.of(context).colorScheme.primary),
        body: content);
  }
}
