import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 32),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'Olá,\n',
            style:
                Get.textTheme.headline5?.copyWith(fontWeight: FontWeight.w500)),
        TextSpan(
            text: 'Bem-vindo',
            style:
                Get.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600))
      ])),
    );
  }
}
