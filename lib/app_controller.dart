import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rex_commerce/fire_store.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}


class AppController extends GetxController {

  final ImagePicker _picker = ImagePicker();

  //final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  XFile? image;
  // var firebase = FirestoreService();
  var listofitems = [].obs;
  var itemName = "";
  var itemPrice = "";
  var itemDescription = "";
  var itemImageUrl = "".obs;

  var itemCategory = "";
  var viewList = [].obs;
  var selectedIndex = [-1].obs;
  var imageURL = "https://imgs.search.brave.com/52yAjB7OLxIEKcXPMeojVM55DJQ4c8-eVv5I8kUDlBc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvcHJldmll/dy0xeC84Ni82Ny9s/YW5kc2NhcGUtcGhv/dG8taW1hZ2Utb3It/cGljdHVyZS1wbGFj/ZWhvbGRlci1mbGF0/LXZlY3Rvci0yOTAw/ODY2Ny5qcGc";
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  onInit()  {
    super.onInit();
    // firebase.init();
  }

  set setItemName(String name) => itemName = name;
  set setItemPrice(String price) => itemPrice = price;
  set setItemDescription(String description) => itemDescription = description;
  set setItemCategory(String category) => itemCategory = category;
  set setItemImageUrl(String imageUrl) => itemImageUrl.value = imageUrl;


  Future<void> uploadImageToFirebase() async {
  print("Hefegebgrgregregergre");
    
  if (image == null) return;

  final File file = File(image!.path);
  final String fileName = Path.basename(file.path);
  print("Hefegebgrgregregergre");
  try {
    await _storage.ref(fileName).putFile(file);
    String downloadURL = await _storage.ref(fileName).getDownloadURL();
    print(downloadURL);
    setItemImageUrl = downloadURL;
  } on FirebaseException catch (e) {
    // Handle any errors
    print(e);
  }
}

Future<String> getDownloadURL() async {
  if (image == null) return '';

  final String fileName = Path.basename(image!.path);
  String downloadURL = await _storage.ref(fileName).getDownloadURL();
  return downloadURL;
}


  void selectImage() async {
    print("select image called");
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print("image selected");
      // print(image!.path);
      // print(image!.name);
      // _image = File(image.path);
      // _uploadImageToFirebase(_image);
    }
  }

  void addItem(){
    CollectionReference products = FirebaseFirestore.instance.collection('Products');
    products.add({
      'Name': itemName,
      'Price': itemPrice,
      'Description': itemDescription,
      'Category': itemCategory,
      'ImageUrl': itemImageUrl.value,
    }).then((value) => print("Item Added"))
    .catchError((error) => print("Failed to add item: $error"));
    listofitems.add({
      'Name': itemName,
      'Price': itemPrice,
      'Description': itemDescription,
      'Category': itemCategory,
      'ImageUrl': itemImageUrl.value,
    });
    viewList.add({
      'Name': itemName,
      'Price': itemPrice,
      'Description': itemDescription,
      'Category': itemCategory,
      'ImageUrl': itemImageUrl.value,
    });
  }
  
  void filterbycategory(String category) {
    viewList.value = listofitems.where((item) {
      final nameLower = item['Category'].toLowerCase();
      final searchLower = category.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    print('${viewList.length}');

  }

  bool checkRecord(){
    if(itemName == "" || itemPrice == "" || itemDescription == "" || itemCategory == ""){
      return false;
    }
    return true;
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