import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rex_commerce/fire_store.dart';


class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}


class AppController extends GetxController {



  // var firebase = FirestoreService();
  var listofitems = [].obs;
  var viewList = [].obs;
  var selectedIndex = [-1].obs;

  @override
  onInit()  {
    super.onInit();
    // firebase.init();
  }
  
  void filterbycategory(String category) {
    viewList.value = listofitems.where((item) {
      final nameLower = item['Category'].toLowerCase();
      final searchLower = category.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

  }

  void search(String query) {
    viewList.value = listofitems.where((item) {
      final nameLower = item['Name'].toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

  }
  static AppController get to => Get.find();

  // final _isDarkMode = false.obs;
  // bool get isDarkMode => _isDarkMode.value;
  // set isDarkMode(bool value) => _isDarkMode.value = value;

  
  
  final List<Category> categories = [
    Category('Electronics', Icons.electrical_services),
    Category('Clothes', Icons.dry_cleaning),
    // Add more categories here
  ];




  //Todo : get firebase set up with images and data


}