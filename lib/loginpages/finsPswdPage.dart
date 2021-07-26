import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/controller/findPswdController.dart';
import 'package:mysideyunseok/widgets/recSubmitButton.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/basicTextField.dart';

class FindPswdPage extends StatelessWidget {
  final FindPswdController findPswdController = Get.put(FindPswdController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '비밀번호 찾기',
        ),
      ),
      body: GetBuilder<FindPswdController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0316 * scrHeight,
                  horizontal: 0.0211 * scrHeight,
                ),
                child: Container(
                  child: Column(
                    children: [
                      BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.nameTextField,
                      ),
                      SizedBox(
                        height: 0.0105 * scrHeight,
                      ),
                      BasicTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.emailTextField,
                      ),
                      SizedBox(
                        height: 0.0105 * scrHeight,
                      ),
                      Text(
                        '이메일/비밀번호 찾기 시 제공되는 정보는 회원인증 이외의 용도로 이용 또는 저장하지 않습니다.',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 0.5 * scrHeight,
                      ),
                      RecSubmitButton(
                        buttonText: '이메일 찾기',
                        scrHeight: scrHeight,
                        activated:
                            controller.nameTextField.tec.text.isNotEmpty &&
                                controller.emailTextField.tec.text.isNotEmpty,
                        validateFunc: () {
                          controller.validateEmail();
                          controller.validatename();
                        },
                      ),
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
}
