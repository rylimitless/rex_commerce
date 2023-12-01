import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rex_commerce/app_controller.dart';

class StudentPromoPage extends StatelessWidget {
  const StudentPromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Promo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentPromoPageView(),
    );
  }
}

class StudentPromoPageView extends StatelessWidget{
   StudentPromoPageView({Key? key}) : super(key: key);
  final AppController controller = AppController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
        const Text('Student Promo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Container(
          height: 400,
          width: 400,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 300,
                  width: 150,
                  child: Image.network(controller.promoList[index]['ImageURL']),
                ),
                Column(children: [
                Center( child : Text(controller.promoList[index]['Name'])),
                Text("\$ ${controller.promoList[index]['Ticket']}"),
                ],)
              ],
            ),
          ),
        ),
        );
      },
      itemCount: controller.promoList.length,
      ),
    );
  }
}