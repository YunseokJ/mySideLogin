import 'package:flutter/material.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';
import 'package:mysideyunseok/widgets/selectableRoundButton.dart';

class CancerAutoCompleteWidget extends StatelessWidget {
  final double scrHeight;
  final TextFieldModel textFieldModel;
  final int cancerNum;
  final Function clicked;

  CancerAutoCompleteWidget({
    @required this.scrHeight,
    @required this.textFieldModel,
    @required this.cancerNum,
    @required this.clicked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 0.0632 * scrHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: textFieldModel.errorOcur
                      ? Color(0xFFEE1100)
                      : textFieldModel.fn.hasFocus
                          ? Color(0xFF3BD7E2)
                          : Color(0xFFDDDDDD),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 0.0632 * scrHeight,
                  width: 2.3 * 0.0632 * scrHeight,
                  child: SelectableRoundButton(
                    buttonText: '기타',
                    isSelected: textFieldModel.fn.hasFocus || cancerNum == 7,
                    onTap: clicked,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
