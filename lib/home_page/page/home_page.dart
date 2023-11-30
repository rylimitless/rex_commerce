import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rex_commerce/home_page/controller/home_controller.dart';
import 'package:rex_commerce/navigation.dart';


class MyHomePage extends StatelessWidget{
  MyHomePage({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: const Icon(Icons.menu),
          title: const Text('Rex Commerce App'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
          ],
        ),

        body: Container (
          padding: const EdgeInsets.only(top:20, left: 20, right: 20),
          child : Column(children: [
          TextField(
            onChanged: (value) {
                //Todo : add search 
            },
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // ListView.builder(itemBuilder: (context, index){
          //   return Container(
          //     height: 100,
          //     color: Colors.amber,
          //     child: const Center(child: Text('Entry')),
          //   );
          // }),
        ],
        )
      ),
      bottomNavigationBar: const AppNavigationBar(),
      ),
    );
  }

}