import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rex_commerce/home_page/page/home_page.dart';
import 'package:rex_commerce/fire_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:get/get.dart';
import 'package:rex_commerce/app_controller.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  await FirestoreService.initialize();
  Get.put(AppController());
  runApp(const MyApp());
  var firebase = FirestoreService();
  firebase.init();
  firebase.addToPromo();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// final controller = Get.find<AppController>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}


