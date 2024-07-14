import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constants/dimensions.dart';
import 'package:untitled1/core/constants/routes.dart';
import 'package:untitled1/core/shared/custom_title.dart';
import 'package:untitled1/features/auth/logic/auth_controller.dart';
import '../../../../core/shared/custom_field.dart';

class LoginBody extends GetView<AuthController> {
  LoginBody({super.key});
  final height = Dimensions.screenHeight * 0.06;
  // final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Center(child: Image.asset("assets/images/logo.png")),
            SizedBox(
              height: height,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: const CustomTitle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  maxLines: 2,
                  text:
                      "Welcome back!\nlog in using your email account to continue us"),
            ),
            SizedBox(
              height: height,
            ),
            CustomField(
                validator: (value) {
                  // if(value != null){
                  //   if(value)
                  //   return;
                  // }
                },
                onChanged: (value) => controller.phone = value,
                label: "Mobile",
                hint: "Enter Your number"),
            SizedBox(
              height: height,
            ),
            CustomField(
                // validator: (value) {},
                onChanged: (value) => controller.password = value,
                isPassword: true,
                label: "Password",
                hint: "Enter Your Password"),
            SizedBox(
              height: Dimensions.screenHeight * 0.03,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomTitle(
                text: "Forget Password ?",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.15,
            ),
            ElevatedButton(
              onPressed: () async{
                if(await controller.login()){
                  Get.offNamed(AppRoutes.homeRoute);
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                // primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                   Radius.circular(8)
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                child: CustomTitle(text: "Sign in",color: Colors.white,fontWeight: FontWeight.w700,fontSize: 18,),

              ),

            ),
            SizedBox(height: Dimensions.screenHeight * 0.03,),
            const CustomTitle(text: "Guest",color: Color(0xFFEBB376),fontSize: 18,)
          ],
        ),
      ),
    );
  }
}
