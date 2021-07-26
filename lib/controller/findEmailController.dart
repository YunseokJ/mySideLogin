import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class FindEmailController extends GetxController {
  TextFieldModel nameTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이름',
    isPswd: false,
    errorMsg: '',
  );

  TextFieldModel phoneTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '휴대폰 번호',
    isPswd: false,
    errorMsg: '',
  );

  @override
  void onInit() {
    nameTextField.tec.addListener(onListenName);
    phoneTextField.tec.addListener(onListenPhone);
    super.onInit();
  }

  @override
  void onClose() {
    nameTextField.tec.removeListener(onListenName);
    phoneTextField.tec.removeListener(onListenPhone);
    super.onClose();
  }

  void onListenName() {
    nameTextField.onListenTextFieldType1();
    update();
  }

  void onListenPhone() {
    phoneTextField.onListenTextFieldType1();
    update();
  }

  void validatename() {
    nameTextField.validateName();
    update();
  }

  void validatePhone() {
    phoneTextField.validatePhone();
    update();
  }
}
