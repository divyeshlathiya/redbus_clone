import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redbus_app/Train/book_train_festival.dart';
import 'package:redbus_app/Train/grid_card.dart';
import 'package:redbus_app/Train/train_search_card.dart';
import 'package:redbus_app/Train/train_title.dart';
import 'package:redbus_app/Train/why_book_redrail.dart';

class TrainHome extends StatefulWidget {
  const TrainHome({super.key});

  @override
  State<TrainHome> createState() => _TrainHomeState();
}

class _TrainHomeState extends State<TrainHome> {
  Widget _searchTrainBtn() {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 70,
      child: ElevatedButton.icon(
        icon: Icon(
          Icons.search,
          color: Colors.white,
          size: 25,
        ),
        label: Text(
          "Search trains",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.red),
        onPressed: () {},
      ),
    );
  }

  final _space = SizedBox(
    height: 13,
  );

  Widget _irctcPartner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/IRCTC_Logo.png",
          width: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Text("IRCTC Authorised Partner")
      ],
    );
  }

  Widget _pnrLiveTrainStatus(String icon, String title) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/$icon",
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  title,
                  // softWrap: true,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrainTitle(),
            TrainSearchCard(),
            _space,
            _searchTrainBtn(),
            _space,
            _irctcPartner(),
            _space,
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child:
                          _pnrLiveTrainStatus("pnr.svg", "Check PNR Status")),
                  Expanded(
                      child:
                          _pnrLiveTrainStatus("lts.svg", "Live train Status"))
                ],
              ),
            ),
            _space,
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridTrainCard(),
            ),
            _space,
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 210, 250, 250)),
              child: Column(
                children: [
                  WhyBookRedRailContainer(),
                  _space,
                  BookTrainFestival()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
