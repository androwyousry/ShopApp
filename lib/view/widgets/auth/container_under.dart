import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppp/utils/theme.dart';
import 'package:shoppp/view/widgets/text_utils.dart';

class CountainerUnder extends StatelessWidget {
  final String textContainer;
  final String textConButton;

  final Function() onPressed;
  const CountainerUnder(
      {super.key,
      required this.textContainer,
      required this.textConButton,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 67,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor : Colors.pink,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100),
          topRight: Radius.circular(100),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            text: textContainer,
            color: Colors.white,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                text: textConButton,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
