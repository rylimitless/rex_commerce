import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  final List<Category> categories = [
    Category('Electronics', Icons.electrical_services),
    Category('Clothes', Icons.dry_cleaning),
    // Add more categories here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(categories[index].icon),
          title: Text(categories[index].name),
          onTap: () {
            // Handle your category selection here
            print('Selected category: ${categories[index].name}');
          },
        );
      },
    );
  }
}