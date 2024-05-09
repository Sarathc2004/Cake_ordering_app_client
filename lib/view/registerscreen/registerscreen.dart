import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_new_client/controller/logincontroller.dart';
import 'package:project_new_client/utils/colorconstant/colorconstant.dart';
import 'package:project_new_client/view/loginscreen/loginscreen.dart';
import 'package:project_new_client/widgets/otp_textfield.dart';

class Registerscreen extends StatelessWidget {
  const Registerscreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Logincontroller>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Lottie.asset(
                      "assets/animations/Animation - 1713941122251.json"),
                ),
                Text(
                  "Create Your Account!!",
                  style: TextStyle(
                      fontSize: 25,
                      color: colorconstant.primarypurple,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.regNamecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.person),
                      labelText: "Your Name",
                      hintText: "Enter Your Name"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.regNamecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.phone_android),
                      labelText: "Mobile Number",
                      hintText: "Enter Your Mobile Number"),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: colorconstant.primarypurple),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Loginscreen());
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: colorconstant.primaryblue),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                OTPtextfield(
                  otpController: ctrl.otpController,
                  visible: ctrl.otpfieldshow,
                  onComplete: (otp) {
                    ctrl.otpEnter = int.tryParse(otp ?? "0000");
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (ctrl.otpfieldshow) {
                      ctrl.adduser();
                      ctrl.regNamecontroller.clear();
                      ctrl.regNamecontroller.clear();
                      ctrl.otpController.clear();
                    } else {
                      ctrl.sendOtp(); // Move this line here
                    }
                  },
                  child: Text(
                    ctrl.otpfieldshow ? "Register" : "Send OTP",
                    style: TextStyle(color: colorconstant.primarywhite),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          colorconstant.primarypurple)),
                ),
                SizedBox(height: 20), // Add some space at the bottom
              ],
            ),
          ),
        ),
      );
    });
  }
}
