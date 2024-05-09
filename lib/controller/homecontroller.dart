import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project_new_client/model/product_category/product_category.dart';
import 'package:project_new_client/model/productmodel/productmodel.dart';
import 'package:project_new_client/utils/colorconstant/colorconstant.dart';

class Homecontroller extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference categoryCollection;
  List<Product> products = [];
  List<Product> productShowInUi = [];
  List<ProductCategory> productCategories = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    categoryCollection = firestore.collection('category');

    await fetchProducts();
    await fetchCategory();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      productShowInUi.assignAll(products);
      Get.snackbar('Success', 'Product fetch successfully',
          colorText: colorconstant.primarygreen);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: colorconstant.primaryred);
      print(e);
    } finally {
      update();
    }
  }

  Future<void> fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<ProductCategory> retrievedCategory = categorySnapshot.docs
          .map((doc) =>
              ProductCategory.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      productCategories.clear();
      productCategories.assignAll(retrievedCategory);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: colorconstant.primaryred);
      print(e);
    } finally {
      update();
    }
  }

  filterByCategory(String category) {
    productShowInUi.clear();
    productShowInUi =
        products.where((product) => product.category == category).toList();
    update();
  }

  filterByFlavor(List<String> flavors) {
    if (flavors.isEmpty) {
      productShowInUi = products;
    } else {
      List<String> LowercaseFlavors =
          flavors.map((flavor) => flavor.toLowerCase()).toList();
      productShowInUi = products
          .where((product) =>
              LowercaseFlavors.contains(product.flavor?.toLowerCase()))
          .toList();
    }
    update();
  }

  sortByprice({required bool ascending}) {
    List<Product> sortedProducts = List<Product>.from(productShowInUi);
    sortedProducts.sort((a, b) => ascending
        ? a.price!.compareTo(b.price!)
        : b.price!.compareTo(a.price!));
    productShowInUi = sortedProducts;
    update();
  }
}
