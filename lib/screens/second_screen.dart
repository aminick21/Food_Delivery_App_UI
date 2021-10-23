import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/widgets/rating_star.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({required this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem){
     return Stack(
       alignment: Alignment.center,
       children: [
         Container(
           height: 175,
             width: 175,
       decoration:BoxDecoration(
         image:DecorationImage(
         image:AssetImage(menuItem.imageUrl),
         fit: BoxFit.cover),
       borderRadius: BorderRadius.circular(15),
       ) ,
         ),
         Container(
           height: 175,
           width: 175,
           decoration: BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.topRight,
               end: Alignment.bottomLeft,
               colors: [
                 Colors.black.withOpacity(.3),
                 Colors.black87.withOpacity(.3),
                 Colors.black54.withOpacity(.3),
                 Colors.black38.withOpacity(.3),
               ]
             ),
             borderRadius: BorderRadius.circular(15),
           ),
         ),
         Positioned(
           bottom: 65,
           child: Column(children: [
             Text(menuItem.name,
               style: TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.bold,
                 letterSpacing: 1.2,
                 color: Colors.white,
               ),),
             Text("\$${menuItem.price}",
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 18,
               ),),
           ],),
         ),
         Positioned(
           bottom: 10,
           right: 10,
           child:
           Container(
             decoration: BoxDecoration(
               color: Theme.of(context).primaryColor,
               borderRadius: BorderRadius.circular(30),
             ),
             child: IconButton(
               icon: Icon(Icons.add,color: Colors.white,),
               onPressed: (){},
             ),

           ),
         )
       ],
     );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(image: AssetImage(widget.restaurant.imageUrl),
                height: 220,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                     icon: Icon(Icons.arrow_back_ios,
                     color: Colors.white,
                     size: 30,),
                      onPressed: (){
                       Navigator.pop(context);
                       },
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite,
                        color: Colors.red,
                        size: 35,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
            ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.restaurant.name,
                    style: TextStyle(
                     fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),),
                    Text("0.2 miles away",
                      style: TextStyle(
                        fontSize: 18,
                      ),),

                  ],),
                  RatingStars(rating:widget.restaurant.rating),
                  Text(widget.restaurant.address,
                    style: TextStyle(
                      fontSize: 18,
                    ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed:(){},
                      child:Text('Reviews'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                      elevation: MaterialStateProperty.all<double>(0),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 30)),
                    ),
                  ),
                  ElevatedButton(onPressed:(){},
                    child:Text('Contacts'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                      elevation: MaterialStateProperty.all<double>(0),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 30)),
                    ),
                  ),



              ],),
            ),
            SizedBox(height: 10,),
            Text("Menu",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),),
            SizedBox(height: 10,),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(10),
                crossAxisCount: 2,
                children:List.generate(widget.restaurant.menu.length, (index) {
                  Food food=widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                }),
              ),
            )

          ],
        ),


      ),
    );
  }
}
