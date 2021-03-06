import 'package:flutter/material.dart';
import 'package:mysideyunseok/widgets/requiredText.dart';

class BuildInfoInputField extends StatelessWidget {
  final double scrHeight;
  final String title;
  final Widget widgetForBuild;
  final bool isRequired;
  final bool isTextField;

  BuildInfoInputField({
    @required this.scrHeight,
    @required this.title,
    @required this.widgetForBuild,
    @required this.isRequired,
    @required this.isTextField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredTextWidget(
          mainText: title,
          isRequired: isRequired,
        ),
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
        widgetForBuild,
        SizedBox(
          height: isTextField ? 0.01 * scrHeight : 0.03 * scrHeight,
        ),
      ],
    );
  }
}
