import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:rex_commerce/app_controller.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AppController appController = AppController.to;
  // Initialize Firebase
  static Future initialize() async {
    await Firebase.initializeApp();
  }

  

  void init() async{
  CollectionReference users = FirebaseFirestore.instance.collection('Products');
  QuerySnapshot querySnapshot = await users.get();
  final allData = querySnapshot.docs.map((doc) => doc.data());

  // Now allData contains all data from 'Products' collection
  for (var data in allData) {
      appController.listofitems.add(data);
      appController.viewList.add(data);
  }
   print("init called ${appController.listofitems.length}");

  }


  // Add more methods for other Firestore operations
}