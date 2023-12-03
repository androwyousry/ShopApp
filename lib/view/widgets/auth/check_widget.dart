import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppp/logic/controllers/auth_controller.dart';
import 'package:shoppp/utils/theme.dart';
import 'package:shoppp/view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.checkBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? Image.asset(
                            'assets/images/check.png',
                          )
                        : Icon(
                            Icons.done,
                            color: pinkClr,
                          )
                    : Container(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Row(
              children: [
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: 'I accept',
                  color: Colors.white,
                ),
                TextUtils(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  text: ' terms & conditions',
                  color: Colors.white,
                  underLine: TextDecoration.underline,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
