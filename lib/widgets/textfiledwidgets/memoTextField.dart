import 'package:flutter/material.dart';
import 'package:mysideyunseok/model/textFieldModel.dart';

class MemoTextField extends StatelessWidget {
  final double scrHeight;
  final TextFieldModel textFieldModel;

  MemoTextField({
    @required this.scrHeight,
    @required this.textFieldModel,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.0197 * scrHeight),
          decoration: BoxDecoration(
            border: Border.all(
              color: textFieldModel.fn.hasFocus
                  ? Color(0xFF3BD7E2)
                  : Color(0xFFDDDDDD),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: TextField(
            maxLines: 3,
            maxLength: 100,
            controller: textFieldModel.tec,
            focusNode: textFieldModel.fn,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '내용을 입력해주세요',
              hintStyle: TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
        Text(
          '이전과 비교하여 어떤 변화가 있었는지 메모해보세요.',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: textFieldModel.fn.hasFocus
                ? Color(0xFF3BD7E2)
                : Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
