
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/cart_screen.dart';
import 'package:food_delivery_app/widgets/nearby_restaurants.dart';
import 'package:food_delivery_app/widgets/recent_orders.dart';
import 'package:food_delivery_app/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: Center(
            child: Text(
          "Food Delivery",
        )),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Cart()));
            },
            child: Text(
              "Cart (5)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SearchBar(),
          RecentOrders(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Nearby Restaurants",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          NearByRestaurants(),

            ],
          ),
    ));
  }
}
