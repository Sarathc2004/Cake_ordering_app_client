import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_new_client/model/productmodel/productmodel.dart';
import 'package:project_new_client/utils/colorconstant/colorconstant.dart';

class Productdescriiptionscrn extends StatelessWidget {
  const Productdescriiptionscrn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments;
    Product product = arguments['data'];
    print([product]);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Dessert details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? "",
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                product.name ?? "",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                product.description ?? "",
                style: TextStyle(
                  fontSize: 16, // Adjust font size as needed
                  fontFamily:
                      'YourFontFamily', // Specify your desired font family
                  color: Colors.black, // Specify text color
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Rs:${product.price}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorconstant.primarygreen),
              )
            ]),
      ),
    );
  }
}
