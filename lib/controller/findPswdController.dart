import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class FindPswdController extends GetxController {
  TextFieldModel nameTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이름',
    isPswd: false,
    errorMsg: '',
  );

  TextFieldModel emailTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이메일 주소',
    isPswd: false,
    errorMsg: '',
  );

  @override
  void onInit() {
    nameTextField.tec.addListener(onListenName);
    emailTextField.tec.addListener(onListenEmail);
    super.onInit();
  }

  @override
  void onClose() {
    nameTextField.tec.removeListener(onListenName);
    emailTextField.tec.removeListener(onListenEmail);
    super.onClose();
  }

  void onListenName() {
    nameTextField.onListenTextFieldType1();
    update();
  }

  void onListenEmail() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void validatename() {
    nameTextField.validateName();
    update();
  }

  void validateEmail() {
    emailTextField.validateEmail();
    update();
  }
}
