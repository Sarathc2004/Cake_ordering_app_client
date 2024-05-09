import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_new_client/model/productmodel/productmodel.dart';
import 'package:project_new_client/utils/colorconstant/colorconstant.dart';
import 'package:project_new_client/view/homescreen/product_descriptionscreen.dart';

class Productcard extends StatelessWidget {
  final String name;
  final String imageurl;
  final double price;
  final String offertag;
  final String description; // Added description field

  const Productcard({
    Key? key,
    required this.name,
    required this.imageurl,
    required this.price,
    required this.offertag,
    required this.description, // Updated constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(Productdescriiptionscrn(), arguments: {
          "data": Product(
              name: name,
              image: imageurl,
              price: price,
              description: description)
        });
      },
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageurl,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 120,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rs:$price',
                    style: TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: colorconstant.primarygreen,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      offertag,
                      style: TextStyle(
                          color: colorconstant.primarywhite, fontSize: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
