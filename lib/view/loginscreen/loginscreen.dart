import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_new_client/controller/logincontroller.dart';
import 'package:project_new_client/utils/colorconstant/colorconstant.dart';
import 'package:project_new_client/view/registerscreen/registerscreen.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Logincontroller>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.blueGrey[50]),
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
                "Welcome Back!",
                style: TextStyle(
                    fontSize: 25,
                    color: colorconstant.primarypurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.logNumbercontroller,
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
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    ctrl.Loginwithphone();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: colorconstant.primarywhite),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          colorconstant.primarypurple)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account?",
                    style: TextStyle(color: colorconstant.primarypurple),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(Registerscreen());
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: colorconstant.primaryblue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
