import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  _buildCartItem(Order order) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: .8),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (order.quantity != 0) {
                                      setState(() {
                                        order.quantity--;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${order.quantity}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      order.quantity++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              child: Center(
                  child: Text(
            "\$${order.food.price}",
            style: TextStyle(fontWeight: FontWeight.w600),
          ))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach((Order order) {
      totalPrice += order.quantity * order.food.price;
    });
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Text("Cart (5)")),
        actions: [
          SizedBox(
            width: 60,
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (index < currentUser.cart.length) {
              Order order = currentUser.cart[index];
              return _buildCartItem(order);
            }

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimated delivery time:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "25 min",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Cost:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.green[700]),
                      ),
                    ],
                  ),
                  SizedBox(height: 100,)
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
              color: Colors.grey,
            );
          },
          itemCount: currentUser.cart.length + 1),
        bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [BoxShadow(
            color: Colors.black26,
            offset: Offset(0,-1),
            blurRadius: 6,
          ),]
        ),
          child: Center(
            child: Text("CHECKOUT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,

            ),
            ),
          ),

      ),
    ));
  }
}
