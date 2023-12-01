import 'package:flutter/material.dart';

class Item {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;

  Item(this.name, this.description, this.imageUrl, this.price, this.category);
}


class ItemListing extends StatelessWidget {
    const ItemListing({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
      return MaterialApp(
        title: 'Item Listing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Item Listing'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: const Center(
            child: Text('Item Listing'),
          ),
        ),
      );

    }

}