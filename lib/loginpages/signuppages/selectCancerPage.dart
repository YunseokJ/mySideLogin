import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/constants.dart';
import 'package:mysideyunseok/controller/selectCancerController.dart';
import 'package:mysideyunseok/widgets/recSubmitButton.dart';
import 'package:mysideyunseok/widgets/selectableRoundButton.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/cancerAutoCompleteWidget.dart';
import 'package:mysideyunseok/widgets/titleAndSubtitleWidget.dart';
import 'package:mysideyunseok/widgets/userInfoPageNumber.dart';

class SelectCancerPage extends StatelessWidget {
  final SelectCancerController selectCancerController =
      Get.put(SelectCancerController());
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
      body: GetBuilder<SelectCancerController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserInfoPageNumber(pageNum: 3, scrHeight: scrHeight),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0211 * scrHeight,
                      vertical: 0.0632 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        TitleAndSubtitleWidget(
                          title: '푸른숲님에게 해당되는\n암 종류를 알려주세요.',
                          subTitle: '정보 입력에 맞는 음식을 추천해 드립니다.',
                          scrHeight: scrHeight,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                        GridView.builder(
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
                              isSelected: controller.cancerNum == index + 1,
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
                          cancerNum: controller.cancerNum,
                          clicked: () {
                            controller.setCancerNum(7);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.176 * scrHeight,
                  ),
                  RecSubmitButton(
                    buttonText: '다음 페이지',
                    scrHeight: scrHeight,
                    activated: controller.cancerNum > 0,
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
