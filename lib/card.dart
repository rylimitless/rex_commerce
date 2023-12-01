import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;

  const ItemCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text(name),
        subtitle: Text(description),
        trailing: Text('\$$price'),
        onTap: () {
          // Handle your item selection here
          print('Selected item: $name');
        },
      ),
    );
  }
}