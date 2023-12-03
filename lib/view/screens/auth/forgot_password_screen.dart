import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppp/utils/my_string.dart';
import 'package:shoppp/utils/theme.dart';
import 'package:shoppp/view/widgets/auth/auth_button.dart';
import 'package:shoppp/view/widgets/auth/auth_text_from_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController forgetPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          title: Text(
            'Forget Password',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : pinkClr,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      ' I you want to recover your account,then please provide your email ID below.. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 350,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AuthTextFormField(
                    controller: forgetPassController,
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
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AuthButton(
                    textButton: 'Send',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
