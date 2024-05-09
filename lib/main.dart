import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_new_client/controller/homecontroller.dart';
import 'package:project_new_client/controller/logincontroller.dart';
import 'package:project_new_client/view/loginscreen/loginscreen.dart';
import 'package:project_new_client/widgets/firebaseoptions.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  Get.put(Logincontroller());
  Get.put(Homecontroller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginscreen(),
    );
  }
}
