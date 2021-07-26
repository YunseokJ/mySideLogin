import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class SignUpMainController extends GetxController {
  TextFieldModel emailTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '이메일',
    isPswd: false,
    errorMsg: '',
  );
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
  TextFieldModel rephoneTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '휴대폰 번호',
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
  TextFieldModel repswdTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '비밀번호 재확인',
    isPswd: true,
    errorMsg: '',
  );

  bool firstSelected = false;
  bool secondSelected = false;
  bool thirdSelected = false;
  bool fourthSelected = false;

  @override
  void onInit() {
    emailTextField.tec.addListener(onListenEmail);
    nameTextField.tec.addListener(onListenName);
    phoneTextField.tec.addListener(onListenPhone);
    rephoneTextField.tec.addListener(onListenRePhone);
    pswdTextField.tec.addListener(onListenPswd);
    repswdTextField.tec.addListener(onListenRePswd);
    super.onInit();
  }

  @override
  void onClose() {
    emailTextField.tec.removeListener(onListenEmail);
    nameTextField.tec.removeListener(onListenName);
    phoneTextField.tec.removeListener(onListenPhone);
    rephoneTextField.tec.removeListener(onListenRePhone);
    pswdTextField.tec.removeListener(onListenPswd);
    repswdTextField.tec.removeListener(onListenRePswd);
    super.onClose();
  }

  void onListenEmail() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void onListenName() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void onListenPhone() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void onListenRePhone() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void onListenPswd() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void onListenRePswd() {
    emailTextField.onListenTextFieldType1();
    update();
  }

  void validateEmail() {
    emailTextField.validateEmail();
    update();
  }

  void validateName() {
    nameTextField.validateName();
    update();
  }

  void validatePhone() {
    phoneTextField.validatePhone();
    update();
  }

  void validateRePhone() {
    rephoneTextField.validateRePhone(phoneTextField.tec.text);
    update();
  }

  void validatePswd() {
    pswdTextField.validatePswd();
    update();
  }

  void validateRepswd() {
    repswdTextField.validateRePswd(pswdTextField.tec.text);
    update();
  }

  void firstClicked() {
    if (firstSelected) {
      firstSelected = false;
      secondSelected = false;
      thirdSelected = false;
      fourthSelected = false;
    } else {
      firstSelected = true;
      secondSelected = true;
      thirdSelected = true;
      fourthSelected = true;
    }
    update();
  }

  void secondClicked() {
    if (secondSelected) {
      if (firstSelected) {
        firstSelected = false;
      }
      secondSelected = false;
    } else {
      if (thirdSelected && fourthSelected) {
        firstSelected = true;
      }
      secondSelected = true;
    }
    update();
  }

  void thirdClicked() {
    if (thirdSelected) {
      if (firstSelected) {
        firstSelected = false;
      }
      thirdSelected = false;
    } else {
      if (secondSelected && fourthSelected) {
        firstSelected = true;
      }
      thirdSelected = true;
    }
    update();
  }

  void fourthClicked() {
    if (fourthSelected) {
      if (firstSelected) {
        firstSelected = false;
      }
      fourthSelected = false;
    } else {
      if (secondSelected && thirdSelected) {
        firstSelected = true;
      }
      fourthSelected = true;
    }
    update();
  }
}
