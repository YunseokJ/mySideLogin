import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class AddHealthDataController extends GetxController {
  int usrType = 0;
  int gender = 0;
  int cancerNm = 0;
  int stageNm = 0;
  int progressNm = 0;
  int diseaseNm = 0;
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
  TextFieldModel cancerTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '암 종류를 입력해주세요',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel memoTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '내용을 입력해주세요',
    isPswd: false,
    errorMsg: '이전과 비교하여 어떤 변화가 있었는지 메모해보세요.',
  );

  @override
  void onInit() {
    ageTextField.tec.addListener(onListenAge);
    heightTextField.tec.addListener(onListenHeight);
    weightTextField.tec.addListener(onListenWeight);
    cancerTextField.tec.addListener(onListenCancer);
    super.onInit();
  }

  @override
  void onClose() {
    ageTextField.tec.removeListener(onListenAge);
    heightTextField.tec.removeListener(onListenHeight);
    weightTextField.tec.removeListener(onListenWeight);
    cancerTextField.tec.removeListener(onListenCancer);
    super.onClose();
  }

  void setGender(int index) {
    gender = index;
    update();
  }

  void setUsrType(int index) {
    usrType = index;
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

  void onListenCancer() {
    weightTextField.onListenTextFieldType1();
    update();
  }

  void validateInfos() {
    ageTextField.validateNumber();
    heightTextField.validateNumber();
    weightTextField.validateNumber();
    update();
  }

  void validateCancer() {
    cancerTextField.validateCancer();
    update();
  }

  void setCancerNum(int index) {
    cancerNm = index;
    update();
  }

  void setStageNum(int index) {
    stageNm = index;
    update();
  }

  void setProgressNum(int index) {
    progressNm = index;
    update();
  }

  void setDiseaseNum(int index) {
    diseaseNm = index;
    update();
  }
}
