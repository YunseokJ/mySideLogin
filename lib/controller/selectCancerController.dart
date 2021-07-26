import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class SelectCancerController extends GetxController {
  TextFieldModel cancerTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '암 종류를 입력해주세요',
    isPswd: false,
    errorMsg: '',
  );

  int cancerNum = 0;

  @override
  void onInit() {
    cancerTextField.tec.addListener(onListenCancer);
    super.onInit();
  }

  @override
  void onClose() {
    cancerTextField.tec.removeListener(onListenCancer);
    super.onClose();
  }

  void onListenCancer() {
    cancerTextField.onListenTextFieldType1();
    update();
  }

  void validateCancer() {
    cancerTextField.validateCancer();
    update();
  }

  void setCancerNum(int index) {
    cancerNum = index;
    update();
  }
}
