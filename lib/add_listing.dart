import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rex_commerce/app_controller.dart';
import 'package:rex_commerce/home_page/page/home_page.dart';

class Item {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;

  Item(this.name, this.description, this.imageUrl, this.price, this.category);
}

class ItemListing extends StatelessWidget {
  ItemListing({Key? key}) : super(key: key);
  final ImagePicker _picker = ImagePicker();
  final AppController controller = AppController.to;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Item Listing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Create Item Listing'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(()=>
                  Container(
                    width: 200.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      image: controller.itemImageUrl.value == ""
                          ? DecorationImage(
                              image: NetworkImage(controller.imageURL),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: NetworkImage(controller.itemImageUrl.value),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: controller.imageURL == null
                        ? Icon(
                            Icons.image,
                            color: Colors.grey[800],
                          )
                        : null,
                  ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        controller.selectImage();
                        if(controller.image != null){
                          print("What is your problem");
                          controller.uploadImageToFirebase();
                          // controller.image = null;
                        }else{
                         print( "Is this reading it as null");
                        }
                      },
                      child: Text('Upload Image')),
                  const SizedBox(height: 20),
                   TextField(
                   onSubmitted: (value) {
                      controller.setItemName = value;
                   },
                    decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Item Name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onSubmitted: (value) {
                      controller.setItemDescription = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Item Description',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onSubmitted: (value) {
                      controller.setItemPrice= value;
                    },
                    decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Item Price',
                    ),
                  ),
                 
                  const SizedBox(height: 20),
                  CustomItem(),                  // Text("Hello World")
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
              print("Pressed");
              if(controller.checkRecord()){
                controller.addItem();
                 Get.defaultDialog(
                  title: "Success",
                  middleText: "Item Added Successfully",
                  onConfirm: () {
                    Navigator.push(context , MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                );
                // Navigator.pop(context);
              }
              else {
                Get.defaultDialog(
                  title: "Error",
                  middleText: "Please fill all the fields",
                  onConfirm: () {
                    Get.back();

                  },
                );

              }
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            tooltip: 'Add Item Listing',
            child: const Icon(Icons.add),
          )),
    );
  }
}



const categories = [
  'Electronics',
  'Clothes',
  'Books',
  'Furniture',
  'Miscellaneous',
  'Tickets',
  'Appliances',

];


class CustomItem extends StatelessWidget {
  CustomItem({Key? key}) : super(key: key);
  final AppController controller = AppController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, // Adjust this value as needed
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if(controller.selectedIndexForAdd[0] == index){
                controller.selectedIndexForAdd[0] = -1;
                controller.setItemCategory = categories[index];
              }else{
                controller.selectedIndexForAdd[0] = index;
                controller.setItemCategory = categories[index];
              }
              // print('${controller.selectedIndexForAdd[0]}');
              
              // Navigator.pop(context); // You may not need this line
            },
            child: Obx(() => Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: (controller.selectedIndexForAdd[0] == index)? Colors.amber: Theme.of(context).colorScheme.primary ,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                categories[index],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            ),
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}