import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class LoginMainController extends GetxController {
  TextFieldModel emailTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이메일',
    isPswd: false,
    errorMsg: '',
  );

  TextFieldModel pswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '비밀번호',
    isPswd: true,
    errorMsg: '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.',
  );

  bool checked = false;

  @override
  void onInit() {
    emailTextField.tec.addListener(onListenEmail);
    pswdTextField.tec.addListener(onListenPassword);
    super.onInit();
  }

  @override
  void onClose() {
    emailTextField.tec.removeListener(onListenEmail);
    pswdTextField.tec.removeListener(onListenPassword);
    super.onClose();
  }

  void onListenEmail() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void onListenPassword() {
    pswdTextField.onListenTextFieldType2();
    update();
  }

  void validateEmail() {
    emailTextField.validateEmail();
    update();
  }

  void validatePswd() {
    pswdTextField.validatePswd();
    update();
  }

  void checkBoxClicked() {
    checked = !checked;
    update();
  }
}
