import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/controller/phoneChangeController.dart';
import 'package:mysideyunseok/widgets/buildInfoInputField.dart';
import 'package:mysideyunseok/widgets/longRoundButton.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/basicTextField.dart';

class PhoneChangePage extends StatelessWidget {
  final PhoneChangeConroller phoneChangeConroller =
      Get.put(PhoneChangeConroller());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '비밀번호 확인',
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<PhoneChangeConroller>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0527 * scrHeight,
                  horizontal: 0.0211 * scrHeight,
                ),
                child: Column(
                  children: [
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '휴대폰',
                      widgetForBuild: BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.phoneTextField,
                      ),
                      isRequired: false,
                      isTextField: true,
                    ),
                    SizedBox(
                      height: 0.3 * scrHeight,
                    ),
                    SizedBox(
                      height: 0.0211 * scrHeight,
                    ),
                    LongRoundButton(
                      buttonText: '저장하기',
                      scrHeight: scrHeight,
                      activated: true,
                      validateFunc: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
