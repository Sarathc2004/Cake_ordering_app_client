import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_new_client/controller/homecontroller.dart';
import 'package:project_new_client/utils/imageconstant/imageconstant.dart';
import 'package:project_new_client/view/loginscreen/loginscreen.dart';
import 'package:project_new_client/widgets/dropdownbtn.dart';
import 'package:project_new_client/widgets/multiselect_dropdwnbtn.dart';
import 'package:project_new_client/widgets/product_card.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homecontroller>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "Cake Store",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    GetStorage box = GetStorage();
                    box.erase();
                    Get.offAll(Loginscreen());
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.productCategories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 85,
                      child: InkWell(
                        onTap: () {
                          ctrl.filterByCategory(
                              ctrl.productCategories[index].name ?? '');
                        },
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: ClipOval(
                                  child: Image.asset(
                                    Imagelist.imagelist[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(ctrl.productCategories[index].name ?? ""),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Dropdownbtn(
                      items: ['Rs:Low to High', 'Rs:High to Low'],
                      selectedItemtext: 'sort',
                      onselected: (selected) {
                        ctrl.sortByprice(
                            ascending:
                                selected == 'Rs:Low to High' ? true : false);
                      },
                    ),
                  ),
                  Expanded(
                    child: Multiselectdropdwn(
                      items: [
                        'Vanila',
                        'Chocolate',
                        'Red velvet',
                        'Lemon',
                        'Strawberry',
                        'Raspberry',
                        'Nuts',
                        'Mango',
                        'Almond',
                        'Cocunut'
                      ],
                      onSelectionChanged: (selectedItems) {
                        print(selectedItems);
                        ctrl.filterByFlavor(selectedItems);
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: ctrl.productShowInUi
                      .length, // Change itemCount according to your requirement
                  itemBuilder: (context, index) {
                    return Productcard(
                      name: ctrl.productShowInUi[index].name ?? "",
                      imageurl: ctrl.productShowInUi[index].image ?? "",
                      price: ctrl.productShowInUi[index].price ?? 00,
                      offertag: '30% off',
                      description:
                          ctrl.productShowInUi[index].description ?? "",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
