import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppp/routes/routes.dart';
import 'package:shoppp/utils/theme.dart';
import 'package:shoppp/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(.2),
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextUtils(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    text: 'Welcome',
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 230,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      text: 'Shop',
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TextUtils(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      text: 'App',
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                child: TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  text: 'Get Started',
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 40,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      text: 'Dont have a account?',
                      color: Colors.white),
                  TextButton(
                    onPressed: () {
                      Get.offNamed(Routes.signUpScreen);
                    },
                    style: ButtonStyle(),
                    child: TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      text: 'SignUp',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
