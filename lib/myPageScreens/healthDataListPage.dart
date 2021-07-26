import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysideyunseok/constants.dart';
import 'package:mysideyunseok/datalistExample.dart';
import 'package:mysideyunseok/widgets/healtDataListPageWidget.dart';
import 'package:mysideyunseok/widgets/showHealthDataWidget.dart';

class HealthDataListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '건강 데이터 목록',
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.0422 * scrHeight,
              ),
              buildYearSelector(scrHeight, '2021', () {}, () {}),
              SizedBox(
                height: 0.0422 * scrHeight,
              ),
              buildMonthSelector(scrHeight, monthList),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0211 * scrHeight),
                child: ShowHealthdataWidget(
                  scrHeight: scrHeight,
                  isMain: false,
                  toAddHealthDataPage: () {},
                  healthDataList: emptyHealthData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
