import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtils(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              text: 'Log',
                              color: Get.isDarkMode ? mainColor : pinkClr,
                            ),
                            TextUtils(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              text: 'IN',
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        AuthTextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Error email ';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset(
                                  'assets/images/email.png',
                                )
                              : Icon(
                                  Icons.email,
                                  color: pinkClr,
                                ),
                          suffixIcon: const Text(""),
                          hintText: 'email',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisability ? false : true,
                              validator: (value) {
                                if (value.toString().length <= 6) {
                                  return 'password should be longer or equal 6 ch';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Image.asset(
                                      'assets/images/lock.png',
                                    )
                                  : Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                    ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visability();
                                },
                                icon: controller.isVisability
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              hintText: 'password',
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgetPasswordScreen);
                            },
                            child: TextUtils(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              text: 'forget password?',
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        AuthButton(
                          textButton: 'LOGIN',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          text: 'OR',
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/google.png',
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/facebook.png',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CountainerUnder(
                textContainer: 'Dont have an Account?',
                textConButton: 'SignUp',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
