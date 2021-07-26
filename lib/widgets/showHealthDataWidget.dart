import 'package:flutter/material.dart';
import 'package:mysideyunseok/model/healthDataListModel.dart';
import 'package:mysideyunseok/widgets/patientDataListTileWidget.dart';

class ShowHealthdataWidget extends StatelessWidget {
  final double scrHeight;
  final bool isMain;
  final VoidCallback toAddHealthDataPage;
  final List<HealthData> healthDataList;

  ShowHealthdataWidget({
    @required this.scrHeight,
    @required this.isMain,
    @required this.toAddHealthDataPage,
    @required this.healthDataList,
  });

  @override
  Widget build(BuildContext context) {
    return healthDataList.length < 1
        ? Container(
            padding: EdgeInsets.fromLTRB(
              scrHeight * 0.0843,
              scrHeight * 0.2069,
              scrHeight * 0.0843,
              0,
            ),
            child: Column(
              children: [
                InkWell(
                  child: Image.asset(
                    'assets/plus.png',
                    height: 62,
                    width: 62,
                  ),
                  onTap: toAddHealthDataPage,
                ),
                SizedBox(
                  height: scrHeight * 0.0527,
                ),
                Text(
                  '어떤 변화가 있었나요?',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '필요한 정보를',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                      TextSpan(
                        text: ' 기록',
                        style: TextStyle(
                          color: Color(0xFF3BD7E2),
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                      TextSpan(
                        text: '해보세요.',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : Column(
            children: [
              isMain
                  ? SizedBox()
                  : Column(
                      children: [
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                        InkWell(
                          child: Image.asset(
                            'assets/plus.png',
                            height: 0.0493 * scrHeight,
                            width: 0.0493 * scrHeight,
                          ),
                          onTap: toAddHealthDataPage,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                      ],
                    ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: healthDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return PatientDataListTileWidget(
                    scrHeight: scrHeight,
                    healthData: healthDataList[index],
                  );
                },
              ),
            ],
          );
  }
}
