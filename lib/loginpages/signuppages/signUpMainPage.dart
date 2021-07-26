import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/controller/signUpMainController.dart';
import 'package:mysideyunseok/widgets/buildInfoInputField.dart';
import 'package:mysideyunseok/widgets/requiredText.dart';
import 'package:mysideyunseok/widgets/buildAgreement.dart';
import 'package:mysideyunseok/widgets/recSubmitButton.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/basicTextField.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/buttonTextField.dart';

class SignUpMainPage extends StatelessWidget {
  final SignUpMainController signUpMainController =
      Get.put(SignUpMainController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '회원가입',
        ),
      ),
      body: GetBuilder<SignUpMainController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.0316 * scrHeight,
                      horizontal: 0.0211 * scrHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '이메일',
                          widgetForBuild: ButtonTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.emailTextField,
                            buttonText: '중복확인',
                            valFunc: () {},
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '이름',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.nameTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '휴대폰',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.phoneTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '휴대폰 재확인',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.rephoneTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '비밀번호',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.pswdTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '비밀번호 재확인',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.repswdTextField,
                          ),
                          isRequired: true,
                          isTextField: true,
                        ),
                        SizedBox(
                          height: 0.0422 * scrHeight,
                        ),
                        BuildAgreement(
                          first: controller.firstSelected,
                          second: controller.secondSelected,
                          third: controller.thirdSelected,
                          forth: controller.fourthSelected,
                          firstCliked: controller.firstClicked,
                          secondClicked: controller.secondClicked,
                          thirdClicked: controller.thirdClicked,
                          forthClicked: controller.fourthClicked,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                      ],
                    ),
                  ),
                  RecSubmitButton(
                    buttonText: '회원가입',
                    scrHeight: scrHeight,
                    activated: controller.emailTextField.tec.text.isNotEmpty &&
                        controller.nameTextField.tec.text.isNotEmpty &&
                        controller.phoneTextField.tec.text.isNotEmpty &&
                        controller.rephoneTextField.tec.text.isNotEmpty &&
                        controller.pswdTextField.tec.text.isNotEmpty &&
                        controller.repswdTextField.tec.text.isNotEmpty &&
                        controller.secondSelected &&
                        controller.thirdSelected,
                    validateFunc: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget addRequiredText(
      String requiredText, Widget textFieldWidget, double scrHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredTextWidget(
          mainText: requiredText,
          isRequired: true,
        ),
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
        textFieldWidget,
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
      ],
    );
  }
}
