import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/all_tickets.dart';

import '../res/styles/app_styles.dart' as style;

class AppDoubleText extends StatelessWidget {
  const AppDoubleText({
    super.key,
    required this.bigText,
    required this.smallText,
    required this.func,
  });
  final String bigText;
  final String smallText;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(bigText, style: style.AppStyles.headLineStyle2),
        InkWell(
          onTap:func,
          child: Text(
            smallText,
            style: style.AppStyles.textStyle.copyWith(
              color: style.AppStyles.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
