import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/constants.dart';
import 'package:mysideyunseok/controller/addHealthDataController.dart';
import 'package:mysideyunseok/widgets/addHealthdataPageWidgets.dart';
import 'package:mysideyunseok/widgets/buildInfoInputField.dart';
import 'package:mysideyunseok/widgets/longRoundButton.dart';
import 'package:mysideyunseok/widgets/selectBetweenTwo.dart';
import 'package:mysideyunseok/widgets/selectableRoundButton.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/cancerAutoCompleteWidget.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/halfWidthTextField.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/memoTextField.dart';
import 'package:mysideyunseok/widgets/titleAndSubtitleWidget.dart';

class AddHealthDataPage extends StatelessWidget {
  final AddHealthDataController addHealthDataController =
      Get.put(AddHealthDataController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '건강 데이터 추가입력',
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<AddHealthDataController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0527 * scrHeight,
                  horizontal: 0.0211 * scrHeight,
                ),
                child: Column(
                  children: [
                    TitleAndSubtitleWidget(
                      title: '환우의 정보를 입력해주세요',
                      subTitle: '환우 정보에 맞는 음식을 추천해 드립니다.',
                      scrHeight: scrHeight,
                    ),
                    SizedBox(
                      height: 0.0527 * scrHeight,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '날짜 선택',
                      widgetForBuild:
                          buildDateSelector(scrHeight, () {}, '2021.07.24'),
                      isRequired: false,
                      isTextField: false,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '사용자 분류',
                      widgetForBuild: SelectBetweenTwo(
                        scrHeight: scrHeight,
                        ind: controller.usrType,
                        selectFunc: controller.setUsrType,
                        firstOption: '환우',
                        secondOption: '보호자',
                      ),
                      isRequired: true,
                      isTextField: false,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '성별',
                      widgetForBuild: SelectBetweenTwo(
                        scrHeight: scrHeight,
                        ind: controller.gender,
                        selectFunc: controller.setGender,
                        firstOption: '남',
                        secondOption: '여',
                      ),
                      isRequired: false,
                      isTextField: false,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '나이',
                      widgetForBuild: HalfWidthTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.ageTextField,
                        tailText: '세',
                      ),
                      isRequired: false,
                      isTextField: true,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '키',
                      widgetForBuild: HalfWidthTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.heightTextField,
                        tailText: 'cm',
                      ),
                      isRequired: false,
                      isTextField: true,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '몸무게',
                      widgetForBuild: HalfWidthTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.weightTextField,
                        tailText: 'kg',
                      ),
                      isRequired: false,
                      isTextField: true,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '암종류',
                      widgetForBuild: Column(
                        children: [
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 6,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 0.0198 * scrHeight,
                              mainAxisSpacing: 0.0198 * scrHeight,
                              childAspectRatio: 2.17,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return SelectableRoundButton(
                                buttonText: cancerType[index],
                                isSelected: controller.cancerNm == index + 1,
                                onTap: () {
                                  controller.setCancerNum(index + 1);
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 0.0198 * scrHeight,
                          ),
                          CancerAutoCompleteWidget(
                            scrHeight: scrHeight,
                            textFieldModel: controller.cancerTextField,
                            cancerNum: controller.cancerNm,
                            clicked: () {
                              controller.setCancerNum(7);
                            },
                          ),
                        ],
                      ),
                      isRequired: true,
                      isTextField: false,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '현재 상태',
                      widgetForBuild: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0.0198 * scrHeight,
                          mainAxisSpacing: 0.0198 * scrHeight,
                          childAspectRatio: 2.17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return SelectableRoundButton(
                            buttonText: stageType[index],
                            isSelected: controller.stageNm == index + 1,
                            onTap: () {
                              controller.setStageNum(index + 1);
                            },
                          );
                        },
                      ),
                      isRequired: true,
                      isTextField: false,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '진행 단계',
                      widgetForBuild: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0.0198 * scrHeight,
                          mainAxisSpacing: 0.0198 * scrHeight,
                          childAspectRatio: 2.17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return SelectableRoundButton(
                            buttonText: progressType[index],
                            isSelected: controller.progressNm == index + 1,
                            onTap: () {
                              controller.setProgressNum(index + 1);
                            },
                          );
                        },
                      ),
                      isRequired: true,
                      isTextField: false,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '보유 질환',
                      widgetForBuild: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0.0198 * scrHeight,
                          mainAxisSpacing: 0.0198 * scrHeight,
                          childAspectRatio: 2.17,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return SelectableRoundButton(
                            buttonText: diseaseList[index],
                            isSelected: controller.diseaseNm == index + 1,
                            onTap: () {
                              controller.setDiseaseNum(index + 1);
                            },
                          );
                        },
                      ),
                      isRequired: false,
                      isTextField: false,
                    ),
                    BuildInfoInputField(
                      scrHeight: scrHeight,
                      title: '추가 내용',
                      widgetForBuild: MemoTextField(
                        scrHeight: scrHeight,
                        textFieldModel: controller.memoTextField,
                      ),
                      isRequired: false,
                      isTextField: false,
                    ),
                    LongRoundButton(
                      buttonText: '저장하기',
                      scrHeight: scrHeight,
                      activated: true,
                      validateFunc: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
