import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppp/logic/controllers/auth_controller.dart';
import 'package:shoppp/routes/routes.dart';
import 'package:shoppp/utils/my_string.dart';
import 'package:shoppp/utils/theme.dart';
import 'package:shoppp/view/widgets/auth/auth_button.dart';
import 'package:shoppp/view/widgets/auth/auth_text_from_field.dart';
import 'package:shoppp/view/widgets/auth/check_widget.dart';
import 'package:shoppp/view/widgets/auth/container_under.dart';
import 'package:shoppp/view/widgets/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
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
                              text: 'Sign',
                              color: Get.isDarkMode ? mainColor : pinkClr,
                            ),
                            TextUtils(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              text: 'Up',
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        AuthTextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Error Name ';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset(
                                  'assets/images/user.png',
                                )
                              : Icon(
                                  Icons.person,
                                  color: pinkClr,
                                ),
                          suffixIcon: const Text(""),
                          hintText: 'User Name',
                        ),
                        SizedBox(
                          height: 15,
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
                        SizedBox(
                          height: 30,
                        ),
                        CheckWidget(),
                        SizedBox(
                          height: 16,
                        ),
                        AuthButton(
                          textButton: 'Sign Up',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CountainerUnder(
                textContainer: 'Already have an Account?',
                textConButton: 'Login',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
