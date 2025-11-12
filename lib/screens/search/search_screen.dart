import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base/res/styles/app_styles.dart';

import '../widgets/app_ticket_tabs.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(height: 40,),
          Text(
            "what are\nyou looking for?",
            style: AppStyles.headLineStyle1.copyWith(fontSize: 35),

          ),
          SizedBox(height: 20,),
          AppTicketTabs()
        ],
      ),
    );
  }
}
