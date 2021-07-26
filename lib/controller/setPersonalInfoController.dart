import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class SetPersonalInfoController extends GetxController {
  int gender = 0;
  TextFieldModel ageTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '00',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel heightTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '00',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel weightTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '00',
    isPswd: false,
    errorMsg: '',
  );

  bool dontKnow = false;

  @override
  void onInit() {
    ageTextField.tec.addListener(onListenAge);
    heightTextField.tec.addListener(onListenHeight);
    weightTextField.tec.addListener(onListenWeight);
    super.onInit();
  }

  @override
  void onClose() {
    ageTextField.tec.removeListener(onListenAge);
    heightTextField.tec.removeListener(onListenHeight);
    weightTextField.tec.removeListener(onListenWeight);
    super.onClose();
  }

  void setGender(int index) {
    gender = index;
    update();
  }

  void onListenAge() {
    ageTextField.onListenTextFieldType1();
    update();
  }

  void onListenHeight() {
    heightTextField.onListenTextFieldType1();
    update();
  }

  void onListenWeight() {
    weightTextField.onListenTextFieldType1();
    update();
  }

  void validateInfos() {
    ageTextField.validateNumber();
    heightTextField.validateNumber();
    weightTextField.validateNumber();
    update();
  }

  void checkClicked() {
    dontKnow = !dontKnow;
    update();
  }
}
