import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rex_commerce/add_listing.dart';
import 'package:rex_commerce/chat.dart';
import 'package:rex_commerce/student_promo.dart';

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
          // Get.to(() => const ItemListing());

        } else if (index == 1) {
          
          // Get.toNamed('/chat');
          Navigator.push(context , MaterialPageRoute(builder: (context) => ChatApp()));

        } else if (index == 2) {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => ItemListing())
          );
        } else if (index == 3) {
          
          // Get.toNamed('/cart');
          Navigator.push(context , MaterialPageRoute(builder: (context) => const StudentPromoPage()));

        } else if (index == 4) {
          // Get.toNamed('/profile');
          // Navigator.push(context,
          // MaterialPageRoute(builder: (context) => const ItemListing())
          // );

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
          icon: const Icon(Icons.local_offer_outlined),
          label: 'Promo',
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