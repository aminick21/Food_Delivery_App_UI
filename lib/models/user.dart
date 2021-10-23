import 'package:food_delivery_app/models/order.dart';

class User {
  final String name;
  final List<Order> recentOrders;
  final List<Order> cart;

  User({
    required this.name,
    required this.recentOrders,
    required this.cart,
  });
}
