import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/components/button.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/models/shop.dart';
import 'package:sushi_restaurant/theme/colors.dart';

class FoodDetailsScreen extends StatefulWidget {
  final Food food;
  const FoodDetailsScreen({super.key, required this.food});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  // quantity count
  int quantityCount = 0;

  // increase quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // decrease quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // add to cart
  void addToCart() {
    // only add to cart if there is something in the cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, quantityCount);

      // let the user know its been added
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                backgroundColor: primaryColor,
                content: const Text(
                  'Added to Cart.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  // done button
                  IconButton(
                    onPressed: () {
                      // pop once to remove alert dialog
                      Navigator.pop(context);

                      // pop again to go to previous screen
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // listview pf food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),

                  // RATING
                  Row(
                    children: [
                      // Star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(width: 5),
                      // rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  const SizedBox(height: 25),

                  // description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Indulge your senses in the sublime dance of flavors that is salmon sushi. Picture this: a platter adorned with glistening, ruby-hued jewels of fresh, succulent salmon, expertly crafted into edible masterpieces. Each bite promises a symphony of sensations, a celebration of the ocean's bounty.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    // quantity
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              '$quantityCount',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 25),

                // add to cart
                MyButton(
                  title: 'Add to Cart',
                  onTap: addToCart,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
