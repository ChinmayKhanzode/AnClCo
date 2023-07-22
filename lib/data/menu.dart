import 'package:food_ordering/data/cuisineData.dart';
import '../model/dish.dart';
import 'catagoriesData.dart';

List<Dish> menuData = [
  Dish(
      name: "Pizza",
      price: 355,
      rating: 4.5,
      time: 120,
      image:
          "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
      category:
          CatagoriesData.firstWhere((element) => element.title == "Pizza"),
      availablity: true,
      description: "Orgeano Fillings with Cheesy Crust",
      venue: "Container",
      cuisine: cuisineData
          .firstWhere((element) => element.title == "Pasta & More ....")),
  Dish(
      name: "Nachos Supreme with Salsa Sause",
      price: 130,
      rating: 4.6,
      time: 16,
      image:
          "https://images.unsplash.com/photo-1582169296194-e4d644c48063?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1300&q=80",
      category:
          CatagoriesData.firstWhere((element) => element.title == "Pizza"),
      availablity: true,
      description: "Crispy Nachos in Minutes ...",
      venue: "Container",
      cuisine: cuisineData
          .firstWhere((element) => element.title == "Continental Tit Bit")),
  Dish(
      name: "Pizza",
      price: 355,
      rating: 4.5,
      time: 120,
      image:
          "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
      category:
          CatagoriesData.firstWhere((element) => element.title == "Burger"),
      availablity: true,
      description: "Orgeano Fillings with Cheesy Crust",
      venue: "Container",
      cuisine: cuisineData
          .firstWhere((element) => element.title == "Continental Tit Bit")),
];
