import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookTrainFestival extends StatelessWidget {
  BookTrainFestival({super.key});

  final List<String> _months = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  String _getCurrentMonth(int month) {
    return _months[month];
  }

  Widget _calenderCard() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white70),
      child: Column(
        children: [
          Text(
            "Get Rs 120 off using code RBRAIL",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.greenAccent)),
                child: Column(
                  children: [
                    SvgPicture.asset("calender_hook.svg"),
                    Text(_getCurrentMonth(DateTime.now().month))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.greenAccent)),
                child: Column(
                  children: [
                    SvgPicture.asset("calender_hook.svg"),
                    Text(_getCurrentMonth(DateTime.now().month + 1))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _bookNowBtn(),
          const SizedBox(
            height: 10,
          ),
          Text("Authorised IRCTC partner")
        ],
      ),
    );
  }

  Widget _bookNowBtn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(Icons.train),
        onPressed: () {},
        label: Text(
          "Book Now",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen[50],
            iconColor: Colors.black,
            foregroundColor: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/newTrain.svg",
                width: 60,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "Book trains for festivals",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _calenderCard(),
        ],
      ),
    );
  }
}
