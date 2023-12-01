import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:rex_commerce/Categories/categories.dart';
import 'package:rex_commerce/home_page/controller/home_controller.dart';
import 'package:rex_commerce/navigation.dart';
import 'package:rex_commerce/fire_store.dart';
import 'package:rex_commerce/app_controller.dart';
import 'package:rex_commerce/chat.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  // final HomeController controller = Get.put(HomeController());
  // final AppController appController = Get.find<AppController>();

  final AppController appController = AppController.to;

  var firebase = FirestoreService();

  final List<Category> categories = [
    Category('Electronics', Icons.electrical_services),
    Category('Clothes', Icons.dry_cleaning),
    Category('Food', Icons.food_bank),
    Category('Furniture', Icons.chair),
    Category('Miscellaneous', Icons.miscellaneous_services),
    Category('Appliances', Icons.sports_basketball),
    Category('Books', Icons.book),
    Category('Tickets', Icons.tag_rounded),
    // Add more categories here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                // firebase.say();
                // handle the press
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      //Todo : add search
                      appController.search(value);
                    },
                    onSubmitted: (value) {
                      appController.search(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          // Text("See All", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                        height: 100,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (appController.selectedIndex[0] == index) {
                                  appController.selectedIndex[0] = -1;
                                  appController.filterbycategory("");
                                  return;
                                } else {
                                  appController.selectedIndex[0] = index;
                                  appController
                                      .filterbycategory(categories[index].name);
                                }

                                // print("Tapepefpepf ${categories[index].name}");
                              },
                              child: Obx(
                                () => Container(
                                  width: 100,
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (appController.selectedIndex[0] ==
                                            index)
                                        ? Colors.amber
                                        : Colors.grey.shade200,
                                  ),
                                  child: Text(categories[index].name),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(children: [
                      const Row(
                        children: [
                          Text(
                            'Products',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Obx(
                        () => Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          height: 500,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 2 / 3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: appController.viewList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 200,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Text('Modal BottomSheet'),
                                              ElevatedButton(
                                                child: const Text(
                                                    'Close BottomSheet'),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: 100,
                                  height: 10,
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Card(
                                    child: ListTile(
                                      leading: Image.network(appController
                                          .viewList[index]["ImageURL"]),
                                      title: Text(appController.viewList[index]
                                          ["Name"]),
                                      // subtitle: Text(appController.listofitems[index]["description"]),
                                      trailing: Text(
                                          '\$${appController.viewList[index]["Price"]}'),
                                      onTap: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                               height: MediaQuery.of(context).size.height * 0.8,
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Center(
                                                          child: SizedBox(
                                                            width: MediaQuery.of(context).size.width * 0.5,
                                                             child: Image.network(
                                                              appController
                                                                      .viewList[
                                                                  index]["ImageURL"]),),
                                                        )
                                                      ,
                                                        Column(
                                                          children: [
                                                            Text(appController
                                                                .viewList[index]
                                                                    ["Name"]
                                                                .toString()),
                                                            Text(appController
                                                                .viewList[index]
                                                                    ["Price"]
                                                                .toString()),
                                                          ],
                                                        ),
                                                       
                                                      ],
                                                    ),
                                                    const SizedBox(height: 20,),
                                                     Padding (
                                                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                                                      
                                                      child: Text(appController
                                                                .viewList[index]
                                                                    ["Description"]
                                                                .toString()),
                                                     ),
                                                    // ),
                                                    const SizedBox(height: 20,),
                                                    
                                                    ElevatedButton(
                                                      child: const Text(
                                                          'Contact Seller'),
                                                      onPressed: () =>
                                                          Navigator.push(
                                                             context, MaterialPageRoute(builder: (context) => ChatApp()) ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        // Handle your item selection here
                                        // print('Selected item: ${appController.listofitems[index]["name"]}');
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),
                  // Main Page stuff
                ],
              )),
        ),
        bottomNavigationBar: const AppNavigationBar(),
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;
  Category(this.name, this.icon);
}
