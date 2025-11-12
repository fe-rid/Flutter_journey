import 'package:flutter/material.dart';
import 'package:flutter_app/base/utilis/all_json.dart';
import 'package:flutter_app/base/widgets/ticket_view.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Tickets")),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList
                  .map(
                    (singleTicket) =>
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                            child: TicketView(ticket: singleTicket, wholeScreen: true,
                            )),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
