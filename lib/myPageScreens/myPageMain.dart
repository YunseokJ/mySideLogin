import 'package:flutter/material.dart';
import 'package:mysideyunseok/constants.dart';
import 'package:mysideyunseok/widgets/textWithMoreButton.dart';
import 'package:mysideyunseok/widgets/widgetForMyPageMain.dart';

class MyPageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF3BD7E2),
      appBar: AppBar(
        backgroundColor: Color(0xFF3BD7E2),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset('assets/top.png'))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 0.0422 * scrHeight,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 0.0649 * scrHeight,
                      backgroundImage: AssetImage('assets/girl.jpg'),
                    ),
                    SizedBox(
                      height: 0.0211 * scrHeight,
                    ),
                    buildNameandNicknameRow('푸른숲', '홍길동'),
                    SizedBox(
                      height: 0.0211 * scrHeight,
                    ),
                    buildhashUserInfo(scrHeight, '위암', '2기', '수술전', '고혈압'),
                    SizedBox(
                      height: 0.0527 * scrHeight,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0211 * scrHeight,
                    vertical: 0.0422 * scrHeight,
                  ),
                  child: Column(
                    children: [
                      buildIconButtons(
                        myPageMainIconText,
                        myPageMainIconName,
                        [() {}, () {}, () {}],
                        scrHeight,
                      ),
                      SizedBox(
                        height: 0.0632 * scrHeight,
                      ),
                      TextWithMoreButton(
                        titleText: '건강 데이터 목록',
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 0.0263 * scrHeight,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
