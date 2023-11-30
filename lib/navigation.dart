import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.primary;
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: 'Home',
          backgroundColor: color,
        ),
         BottomNavigationBarItem(
          icon: const Icon(Icons.message_outlined),
          label: 'Chat',
          backgroundColor: color,
        ),
         BottomNavigationBarItem(
          icon: const Icon(Icons.explore_outlined),
          label: 'Explore',
          backgroundColor: color,
        ),
        
        
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
          backgroundColor: color,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_2_outlined),
          label: 'Profile',
          backgroundColor: color,
        ),
       
      ],
      selectedItemColor:const Color.fromARGB(255, 238, 196, 7),
    );
  }
}