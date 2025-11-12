import 'package:flutter/cupertino.dart';

class AppLayoutbuilderWidget extends StatelessWidget {
  final int randomDivider;
  const AppLayoutbuilderWidget({super.key, required this.randomDivider});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      return Flex(
          direction: Axis.horizontal,

      );
    });
  }
}
