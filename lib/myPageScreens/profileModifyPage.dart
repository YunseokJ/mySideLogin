import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mysideyunseok/controller/profileModifyController.dart';
import 'package:mysideyunseok/widgets/buildInfoInputField.dart';
import 'package:mysideyunseok/widgets/longRoundButton.dart';
import 'package:mysideyunseok/widgets/profileModifyPageWidget.dart';
import 'package:mysideyunseok/widgets/textfiledwidgets/basicTextField.dart';

class ProfileModifyPage extends StatelessWidget {
  final ProfileModifyController profileModifyController =
      Get.put(ProfileModifyController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '프로필 수정',
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<ProfileModifyController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.0527 * scrHeight,
                      horizontal: 0.0211 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        BuildInfoInputField(
                          scrHeight: scrHeight,
                          title: '닉네임',
                          widgetForBuild: BasicTextField(
                            scrHeight: scrHeight,
                            textFieldModel: controller.nicknameTextField,
                          ),
                          isRequired: false,
                          isTextField: true,
                        ),
                        LongRoundButton(
                          buttonText: '저장하기',
                          scrHeight: scrHeight,
                          activated: true,
                          validateFunc: () {},
                        ),
                        SizedBox(
                          height: 0.03 * scrHeight,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(),
                        ),
                      ],
                    ),
                  ),
                  buildProfileInfoTile(
                    scrHeight,
                    '이메일',
                    Text(
                      'myside@myside.com',
                      style: TextStyle(
                        color: Color(0xFF3BD7E2),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: buildProfileInfoTile(
                      scrHeight,
                      '휴대폰 번호',
                      Row(
                        children: [
                          Text(
                            '+82 10-12**-56**',
                            style: TextStyle(
                              color: Color(0xFF3BD7E2),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: scrHeight * 0.0105,
                          ),
                          SvgPicture.asset('assets/arrowright.svg'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: buildProfileInfoTile(
                      scrHeight,
                      '비밀번호 변경',
                      SvgPicture.asset('assets/arrowright.svg'),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
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
