import 'package:flutter/material.dart';

class SmallRoundButton extends StatelessWidget {
  final double scrHeight;
  final String buttonText;
  final VoidCallback onTap;
  final double buttonWidth;

  SmallRoundButton({
    @required this.scrHeight,
    @required this.buttonText,
    @required this.onTap,
    this.buttonWidth,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          width: buttonWidth ?? 0.0527 * scrHeight,
          height: 0.0316 * scrHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFDDDDDD),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: TextStyle(
                color: Color(0xFFAAAAAA),
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
