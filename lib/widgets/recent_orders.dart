import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("Recent Orders",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            height: 120,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.recentOrders.length,
                itemBuilder:(BuildContext context,index){
                    return RecentOrderTile(index: index) ;
                }
                ),
          ),
        ),
      ],
    );
  }
}
 class RecentOrderTile extends StatelessWidget {
 final int index;
 RecentOrderTile({ required this.index});
   @override
   Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.all(10.0),
       width: 320,
       height: 100,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(15),
         border: Border.all(
           width: 1,
           color: Colors.grey,
         )
       ),
       child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Expanded(
             child: Row( 
               children: [
                 ClipRRect(
                   borderRadius: BorderRadius.circular(15),
                   child: Image(image: AssetImage(currentUser.recentOrders[index].food.imageUrl,),
                     height: 100,
                     width: 100,
                     fit: BoxFit.cover,
                   ),
                 ),
                 Expanded(
                   child: Container(
                     margin: EdgeInsets.all(12),
                     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                       Text(currentUser.recentOrders[index].food.name,
                       style: TextStyle(
                         fontWeight: FontWeight.w600,
                         fontSize: 16,
                       ),
                       overflow: TextOverflow.ellipsis,),
                       Text(currentUser.recentOrders[index].restaurant.name,
                           style: TextStyle(
                             fontWeight: FontWeight.w600,
                             fontSize: 16,
                           ),
                            overflow: TextOverflow.ellipsis,),
                       Text(currentUser.recentOrders[index].date,
                       style: TextStyle(
                         fontWeight: FontWeight.w600,
                         fontSize: 16,
                       ),
                        overflow: TextOverflow.ellipsis,),

                     ],),
                   ),
                 ),
               ],
             ),
           ),
           Container(
             margin: EdgeInsets.only(right: 20),
             width: 48,
             decoration: BoxDecoration(
               color: Theme.of(context).primaryColor,
               borderRadius: BorderRadius.circular(30),
             ),
             child: IconButton(
                 icon: Icon(Icons.add,color: Colors.white,),
               onPressed: (){},
             ),

           ),



         ],
       ),
       
     ) ;
   }
 }
 