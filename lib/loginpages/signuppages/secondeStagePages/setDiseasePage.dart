import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mysideyunseok/constants.dart';
import 'package:mysideyunseok/controller/setDiseaseController.dart';
import 'package:mysideyunseok/widgets/secondStagePageNumber.dart';
import 'package:mysideyunseok/widgets/secondStageTextSytle.dart';
import 'package:mysideyunseok/widgets/selectableRoundButton.dart';
import 'package:mysideyunseok/widgets/skipButton.dart';
import 'package:mysideyunseok/widgets/titleAndSubtitleWidget.dart';

class SetDiseasePage extends StatelessWidget {
  final SetDiseaseController setDiseaseController =
      Get.put(SetDiseaseController());
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
      body: GetBuilder<SetDiseaseController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SecondStagePageNumber(pageNum: 2, scrHeight: scrHeight),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0211 * scrHeight,
                      vertical: 0.0632 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        TitleAndSubtitleWidget(
                          title: '푸른숲님의\n정보를 입력해주세요.',
                          subTitle: '정보 입력에 맞는 음식을 추천해 드립니다.',
                          scrHeight: scrHeight,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                        SecondStageTextStyle(title: '04. 보유질환을 선택해주세요.'),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0.0198 * scrHeight,
                            mainAxisSpacing: 0.0198 * scrHeight,
                            childAspectRatio: 2.17,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return SelectableRoundButton(
                              buttonText: diseaseList[index],
                              isSelected: controller.diseaseNum == index + 1,
                              onTap: () {
                                controller.setDiseaseNum(index + 1);
                              },
                            );
                          },
                        ),
                      ],
                    ),
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
