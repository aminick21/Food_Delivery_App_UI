
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';

class Order {
  Restaurant restaurant;
  Food food;
  String date;
  int quantity;

  Order({
    required this.date,
    required this.restaurant,
    required this.food,
    required this.quantity,
  });
}
