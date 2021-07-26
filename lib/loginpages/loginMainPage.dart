import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/controller/loginMainController.dart';
import 'package:mysideyunseok/widgets/checkWidget.dart';
import 'package:mysideyunseok/widgets/longRoundButton.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/basicTextField.dart';
import 'package:mysideyunseok/widgets/titleAndSubtitleWidget.dart';

class LoginMainPage extends StatelessWidget {
  final LoginMainController loginMainController =
      Get.put(LoginMainController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<LoginMainController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0867 * scrHeight,
                  horizontal: 0.0211 * scrHeight,
                ),
                child: Container(
                  child: Column(
                    children: [
                      TitleAndSubtitleWidget(
                        title: '이웃집닥터가\n처음이신가요?',
                        subTitle: '로그인하고 이웃집닥터 서비스를 이용해보세요.',
                        scrHeight: scrHeight,
                      ),
                      SizedBox(
                        height: 0.0422 * scrHeight,
                      ),
                      BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.emailTextField,
                      ),
                      SizedBox(
                        height: 0.0105 * scrHeight,
                      ),
                      BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.pswdTextField,
                      ),
                      SizedBox(
                        height: 0.0211 * scrHeight,
                      ),
                      CheckWidget(
                          checkText: '자동로그인',
                          checked: controller.checked,
                          scrHeight: scrHeight,
                          checkClicked: controller.checkBoxClicked),
                      SizedBox(
                        height: 0.0422 * scrHeight,
                      ),
                      LongRoundButton(
                        buttonText: '로그인',
                        scrHeight: scrHeight,
                        activated:
                            controller.emailTextField.tec.text.isNotEmpty &&
                                controller.pswdTextField.tec.text.isNotEmpty,
                        validateFunc: () {
                          controller.validateEmail();
                          controller.validatePswd();
                        },
                      ),
                      SizedBox(
                        height: 0.0211 * scrHeight,
                      ),
                      buildTextButtons(scrHeight),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTextButtons(double scrHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textButton(() {}, '이메일 찾기'),
        Text(
          ' | ',
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        textButton(() {}, '비밀번호 찾기'),
        Text(
          ' | ',
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        textButton(() {}, '이메일로 회원가입'),
      ],
    );
  }

  Widget textButton(VoidCallback routeFunc, String buttonText) {
    return InkWell(
      onTap: routeFunc,
      child: Text(
        buttonText,
        style: TextStyle(
          color: Color(0xFF666666),
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
