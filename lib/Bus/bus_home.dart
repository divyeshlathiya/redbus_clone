import 'package:flutter/material.dart';
import 'package:redbus_app/Bus/from_to_city_card.dart';
import 'package:redbus_app/Bus/govt_bus_card.dart';
import 'package:redbus_app/Bus/offers.dart';

class BusTicketHomeScreen extends StatefulWidget {
  const BusTicketHomeScreen({super.key});

  @override
  State<BusTicketHomeScreen> createState() => _BusTicketHomeScreenState();
}

class _BusTicketHomeScreenState extends State<BusTicketHomeScreen> {
  
  Widget _searchBusBtn() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton.icon(
        icon: Icon(
          Icons.search,
          color: Colors.white,
          size: 25,
        ),
        label: Text(
          "Search buses",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.red),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bus Tickets",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    fontFamily: "Times new roman"),
              ),
              FromToCityCardUI(),
              const SizedBox(
                height: 15,
              ),
              _searchBusBtn(),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Government Buses",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times new Roman"),
              ),
              const SizedBox(
                height: 15,
              ),

              // Show Government Buses Tie-up
              GovtBusesCard(),

              // Offers
              Offers()
            ],
          ),
        ),
      ),
    );
  }
}
