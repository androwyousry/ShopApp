import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppp/utils/theme.dart';
import 'package:shoppp/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String textButton;
  final Function() onPressed;
  const AuthButton(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Get.isDarkMode ? mainColor : Colors.pink,
        minimumSize: Size(300, 50),
      ),
      child: TextUtils(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        text: textButton,
        color: Colors.white,
      ),
    );
  }
}
