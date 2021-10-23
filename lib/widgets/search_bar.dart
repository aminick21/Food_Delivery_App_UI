import 'package:flutter/material.dart';
class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: .8,color:Theme.of(context).primaryColor),),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  width: .8,
                  color: Colors.grey,)),
            hintText: "Search Food or Restaurants",
            prefixIcon: Icon(
              Icons.search,
              size: 30,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                size: 30,
                color: Colors.grey,
              ),
              onPressed: () {},
            )),
      ),
    );
  }
}
