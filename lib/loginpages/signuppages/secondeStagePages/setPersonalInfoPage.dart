import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/controller/setPersonalInfoController.dart';
import 'package:mysideyunseok/widgets/checkWidget.dart';
import 'package:mysideyunseok/widgets/recSubmitButton.dart';
import 'package:mysideyunseok/widgets/secondStagePageNumber.dart';
import 'package:mysideyunseok/widgets/secondStageTextSytle.dart';
import 'package:mysideyunseok/widgets/selectBetweenTwo.dart';
import 'package:mysideyunseok/widgets/skipButton.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/halfWidthTextField.dart';
import 'package:mysideyunseok/widgets/titleAndSubtitleWidget.dart';

class SetPersonalInfoPage extends StatelessWidget {
  final SetPersonalInfoController setPersonalInfoController =
      Get.put(SetPersonalInfoController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '환우 정보 2단계 입력',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF31B6F7),
        actions: [SkipButton(onTap: () {}), SizedBox(width: 0.01 * scrHeight)],
      ),
      body: GetBuilder<SetPersonalInfoController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SecondStagePageNumber(pageNum: 1, scrHeight: scrHeight),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0211 * scrHeight,
                      vertical: 0.0632 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        TitleAndSubtitleWidget(
                          title: '푸른숲님의\n진행 단계를 알려주세요.',
                          subTitle: '정보 입력에 맞는 음식을 추천해 드립니다.',
                          scrHeight: scrHeight,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                        SecondStageTextStyle(title: '01. 성별을 선택해주세요.'),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        SelectBetweenTwo(
                          scrHeight: scrHeight,
                          ind: controller.gender,
                          selectFunc: controller.setGender,
                          firstOption: '남',
                          secondOption: '여',
                        ),
                        SizedBox(
                          height: 0.0422 * scrHeight,
                        ),
                        SecondStageTextStyle(title: '02. 나이를 알려주세요.'),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        HalfWidthTextField(
                          scrHeight: scrHeight,
                          textFieldModel: controller.ageTextField,
                          tailText: '세',
                        ),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        SecondStageTextStyle(title: '03. 키와 몸무게를 알려주세요.'),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        Row(
                          children: [
                            HalfWidthTextField(
                              scrHeight: scrHeight,
                              textFieldModel: controller.heightTextField,
                              tailText: 'cm',
                            ),
                            Spacer(),
                            HalfWidthTextField(
                              scrHeight: scrHeight,
                              textFieldModel: controller.weightTextField,
                              tailText: 'kg',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.0105 * scrHeight,
                        ),
                        CheckWidget(
                          checked: controller.dontKnow,
                          checkText: '모르겠어요',
                          scrHeight: scrHeight,
                          checkClicked: controller.checkClicked,
                        ),
                      ],
                    ),
                  ),
                  RecSubmitButton(
                    buttonText: '다음 페이지',
                    scrHeight: scrHeight,
                    activated: controller.gender > 0 &&
                        controller.ageTextField.tec.text.isNotEmpty &&
                        (controller.dontKnow ||
                            (controller.heightTextField.tec.text.isNotEmpty &&
                                controller
                                    .weightTextField.tec.text.isNotEmpty)),
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
