import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/constants.dart';
import 'package:mysideyunseok/controller/progressSelectController.dart';
import 'package:mysideyunseok/widgets/recSubmitButton.dart';
import 'package:mysideyunseok/widgets/selectableRoundButton.dart';
import 'package:mysideyunseok/widgets/titleAndSubtitleWidget.dart';
import 'package:mysideyunseok/widgets/userInfoPageNumber.dart';

class ProgressSelectPage extends StatelessWidget {
  final ProgressSelectController progressSelectController =
      Get.put(ProgressSelectController());
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
      body: GetBuilder<ProgressSelectController>(
        builder: (controller) {
          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                UserInfoPageNumber(pageNum: 5, scrHeight: scrHeight),
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
                      GridView.builder(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.17 * scrHeight,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RecSubmitButton(
                        buttonText: '완료 할래요',
                        scrHeight: scrHeight,
                        activated: controller.progressNm > 0,
                        validateFunc: () {},
                        rectButtonColor: Color(0xFF666666),
                      ),
                    ),
                    Expanded(
                      child: RecSubmitButton(
                        buttonText: '2단계 입력하러 갈래요',
                        scrHeight: scrHeight,
                        activated: controller.progressNm > 0,
                        validateFunc: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
