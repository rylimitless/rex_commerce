import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rex_commerce/add_listing.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.primary;
    return BottomNavigationBar(
      currentIndex: 0,
      elevation: 0.0,
      onTap: (index) {
        if (index == 0) {
          // Get.toNamed('/home');
        } else if (index == 1) {
          // Get.toNamed('/chat');
        } else if (index == 2) {
          Get.to(() => const ItemListing());
        } else if (index == 3) {
          // Get.toNamed('/cart');
        } else if (index == 4) {
          // Get.toNamed('/profile');
        }
      },
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
          icon: const Icon(Icons.store_outlined),
          label: 'Sell',
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