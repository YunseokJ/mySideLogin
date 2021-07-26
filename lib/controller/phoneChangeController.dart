import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class PhoneChangeConroller extends GetxController {
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
}
