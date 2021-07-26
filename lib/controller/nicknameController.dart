import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class NicknameController extends GetxController {
  TextFieldModel nicknameTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '닉네임',
    isPswd: false,
    errorMsg: '특수문자 제외',
  );

  @override
  void onInit() {
    nicknameTextField.tec.addListener(onListenNickname);
    super.onInit();
  }

  @override
  void onClose() {
    nicknameTextField.tec.removeListener(onListenNickname);
    super.onClose();
  }

  void onListenNickname() {
    nicknameTextField.onListenTextFieldType2();
    update();
  }

  void validateNickname() {
    nicknameTextField.validateNickname();
    update();
  }
}
