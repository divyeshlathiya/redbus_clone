import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  Widget _userDetailsConatiner() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("userProfile.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withAlpha(200),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              "User",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "919876543210",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "Member since Jul 2021",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tripsTravelCarbonSaving() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "6",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text("Total trips")
            ],
          ),
          SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Colors.black,
            ),
          ),
          Column(
            children: [
              Text(
                "1670 km",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text("Travelled")
            ],
          ),
          SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Colors.black,
            ),
          ),
          Column(
            children: [
              Text(
                "177 kg",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text("Carbon saving")
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_userDetailsConatiner(), _tripsTravelCarbonSaving()],
    );
  }
}
