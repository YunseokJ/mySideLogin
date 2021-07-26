import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class CheckPswdController extends GetxController {
  TextFieldModel pswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '비밀번호',
    isPswd: true,
    errorMsg: '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
  );

  @override
  void onInit() {
    pswdTextField.tec.addListener(onListenPswd);
    super.onInit();
  }

  void onListenPswd() {
    pswdTextField.onListenTextFieldType2();
    update();
  }

  void validatePswd() {
    pswdTextField.validatePswd();
    update();
  }
}
