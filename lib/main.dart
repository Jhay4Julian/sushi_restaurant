import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/models/shop.dart';
import 'package:sushi_restaurant/screens/cart_screen.dart';

import 'screens/home_screen.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
      routes: {
        '/introscreen': (context) => const IntroScreen(),
        '/homescreen': (context) => const HomeScreen(),
        '/cartscreen': (context) => const CartScreen(),
      },
    );
  }
}
