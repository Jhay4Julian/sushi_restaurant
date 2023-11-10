import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    // salmon sushi
    Food(
      name: "Salmon Sushi",
      price: "15.00",
      imagePath: "assets/images/salmon.png",
      rating: "4.8",
    ),
    // tuna
    Food(
      name: "Tuna",
      price: "20.00",
      imagePath: "assets/images/sushi_many.png",
      rating: "4.5",
    ),
  ];

  // customer cart
  final List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
