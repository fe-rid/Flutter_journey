import 'package:flutter/material.dart';
import 'package:flutter_app/base/widgets/app_column_text_layout.dart';
import 'package:flutter_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:flutter_app/base/widgets/big_circle.dart';
import 'package:flutter_app/base/widgets/big_dot.dart';
import 'package:flutter_app/base/widgets/text_style_fourth.dart';
import 'package:flutter_app/base/widgets/text_style_third.dart';
import '../res/styles/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;

  const TicketView({super.key, required this.ticket, this.wholeScreen=false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 189,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Column(
          children: [
            //blue part of th ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.ticketBlue,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              child: Column(
                children: [
                  // show departure and destination with icons first line
                  Row(
                    children: [
                      // Left city
                      TextStyleThird(text: ticket["from"]["code"],),

                      const Expanded(child: SizedBox()),

                      // Left dot
                      const BigDot(),

                      // Airplane and dashed line
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 24,
                              child: AppLayoutbuilderWidget(randomDivider: 6),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.55,
                                child: const Icon(
                                  Icons.local_airport_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Right dot
                      const BigDot(),
                     //ticket flying icon
                      const Expanded(child: SizedBox()),

                      // Right city
                      TextStyleThird(text: ticket["to"]["code"],),
                    ],
                  ),
                  SizedBox(height: 3),
                  //show departure and destination with time
                  Row(
                    children: [
                      // Left city
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket["from"]["name"],),
                      ),

                      const Expanded(child: SizedBox()),
                      TextStyleFourth(text: ticket["flying_time"]),

                      const Expanded(child: SizedBox()),

                      // Right city
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["to"]["name"],
                          align: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //circles and dots
            Container(
              height: 20,
              color: AppStyles.ticketOrange,
              child: Row(
                children: [
                  BigCircle(isRight: false),
                  Expanded(child: Container()),
                  BigCircle(isRight: true),
                ],
              ),
            ),
            //orange part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.ticketOrange,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(21),
                ),
              ),
              child: Column(
                children: [
                  // show departure and destination with icons first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left city
                      AppColumnTextLayout(
                        topText: ticket["date"],
                        bottomText: "DATE",
                        alignment: CrossAxisAlignment.start,
                      ),
                      AppColumnTextLayout(
                        topText: ticket["departure_time"],
                        bottomText: "Departure Time",
                        alignment: CrossAxisAlignment.center,
                      ),
                      AppColumnTextLayout(
                        topText: ticket["number"].toString(),
                        bottomText: "Number",
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
