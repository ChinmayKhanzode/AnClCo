import 'package:food_ordering/data/catagoriesData.dart';
import 'package:food_ordering/data/menu.dart';
import 'package:food_ordering/model/dish.dart';

List BannerData = [
  'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
  'https://plus.unsplash.com/premium_photo-1673747885079-6a915d368c82?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
  'https://karnavatiuniversity.edu.in/wp-content/uploads/2023/03/Viaje-2023.jpg',
  'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
];

// to order according to rating, when feching from firebase parameter .orderBy(rating,aceending)
List<Dish> mostLiked = [
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
      cuisine: menuData[0].cuisine)
];
