import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:project_new_client/model/usermodel/usermodel.dart';
import 'package:project_new_client/utils/colorconstant/colorconstant.dart';
import 'package:project_new_client/view/homescreen/homescreen.dart';

class Logincontroller extends GetxController {
  GetStorage box = GetStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController regNamecontroller = TextEditingController();
  TextEditingController regNumbercontroller = TextEditingController();
  TextEditingController logNumbercontroller = TextEditingController();
  TextEditingController logNamecontroller = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpfieldshow = false;
  int? otpsend;
  int? otpEnter;
  User? loginUser;

  @override
  void onReady() {
    Map<String, dynamic> user = box.read('loginuser');
    if (User != null) {
      loginUser = User.fromJson(user);
      Get.to(Homescreen());
    }
    super.onReady();
  }

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }

  adduser() {
    try {
      if (otpsend == otpEnter) {
        DocumentReference doc = userCollection.doc();
        User user = User(
            id: doc.id,
            name: regNamecontroller.text,
            number: int.parse(regNamecontroller.text));
        final userJson = user.toJson();

        doc.set(userJson);

        Get.snackbar("Success", "User added successfully",
            colorText: colorconstant.primarygreen);
      } else {
        Get.snackbar("Error", "OTP incorrect",
            colorText: colorconstant.primaryred);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: colorconstant.primaryred);
      print(e);
    }
  }

  sendOtp() {
    try {
      if (regNamecontroller.text.isEmpty || regNamecontroller.text.isEmpty) {
        Get.snackbar("Error", "Please fill in all fields",
            colorText: colorconstant.primaryred);
        return;
      }

      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      print(otp);

      if (otp != null) {
        otpfieldshow = true;
        otpsend = otp;
        Get.snackbar("Success", "OTP sent successfully!!",
            colorText: colorconstant.primarygreen);
      } else {
        Get.snackbar("Error", "OTP not sent !!",
            colorText: colorconstant.primaryred);
      }
    } catch (e) {
      print(e);
    } finally {
      update();
    }
  }

  Future<void> Loginwithphone() async {
    try {
      String phoneNumber = logNumbercontroller.text;
      if (phoneNumber.isNotEmpty) {
        var querySnapshot = await userCollection
            .where('number', isEqualTo: int.tryParse(phoneNumber))
            .limit(1)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
          box.write('loginuser', userData);
          logNumbercontroller.clear();
          Get.to(Homescreen());
          Get.snackbar('Success', 'Login successfull',
              colorText: colorconstant.primarygreen);
        } else {
          Get.snackbar('Error', 'User not found,please register',
              colorText: colorconstant.primaryred);
        }
      } else {
        Get.snackbar('Error', 'Please enter a phone number',
            colorText: colorconstant.primaryred);
      }
    } catch (error) {
      print("failed to login");
    }
  }
}
