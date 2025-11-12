import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTicketTabs extends StatelessWidget {
  const AppTicketTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xFFF4F6FD),
      ),
      child: Row(
        children: [
          AppTabs(
              tabText: "All tickets"
          ),
          AppTabs(
              tabBorder: true,
              tabText: "Hotels",
            tabColor: true,
          ),
        ],
      ),
    );
  }
}

class AppTabs extends StatelessWidget {
  const AppTabs({
    super.key,
    this.tabBorder = false,
    this.tabText = "",
    this.tabColor = false,
  });

  final String tabText;
  final bool tabBorder;
  final bool tabColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.44,
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: tabColor==false?Colors.white:Colors.transparent,
        borderRadius: tabBorder == false
            ? BorderRadius.horizontal(left: Radius.circular(50))
            : BorderRadius.horizontal(right: Radius.circular(50)),
      ), // Fixed: moved comma here
      child: Center(child: Text(tabText)), // Now this is properly placed
    );
  }
}
