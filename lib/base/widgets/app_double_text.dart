import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart' as style;

class AppDoubleText extends StatelessWidget {
  const AppDoubleText({super.key, required this.bigText, required this.smallText});
  final String bigText;
  final String smallText;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(bigText, style:style.AppStyles.headLineStyle2),
        InkWell(
          onTap: (){

          },
          child: Text(smallText, style:style.AppStyles.textStyle.copyWith(
            color: style.AppStyles.primaryColor
          )),

        )
      ],
    );
  }
}
