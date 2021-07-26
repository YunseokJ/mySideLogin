import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/controller/nicknameController.dart';
import 'package:mysideyunseok/widgets/recSubmitButton.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/buttonTextField.dart';
import 'package:mysideyunseok/widgets/titleAndSubtitleWidget.dart';
import 'package:mysideyunseok/widgets/userInfoPageNumber.dart';

class NicknamePage extends StatelessWidget {
  final NicknameController nicknameController = Get.put(NicknameController());

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '환우 정보 입력',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF31B6F7),
      ),
      body: GetBuilder<NicknameController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserInfoPageNumber(pageNum: 2, scrHeight: scrHeight),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0211 * scrHeight,
                      vertical: 0.0632 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        TitleAndSubtitleWidget(
                          title: '닉네임을 입력해주세요.',
                          subTitle: '이웃집닥터를 활동할 때 쓰여지는 이름입니다.',
                          scrHeight: scrHeight,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                        ButtonTextField(
                          scrHeight: scrHeight,
                          textFieldModel: controller.nicknameTextField,
                          buttonText: '중복확인',
                          //중복확인함
                          valFunc: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.36 * scrHeight,
                  ),
                  RecSubmitButton(
                    buttonText: '다음 페이지',
                    scrHeight: scrHeight,
                    activated: true,
                    //중복이 없으면 다음페이지
                    validateFunc: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
