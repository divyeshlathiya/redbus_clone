import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrainTitle extends StatelessWidget {
  const TrainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book train tickets",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Seat filling fast",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        ),
        SizedBox(
          child: SvgPicture.asset(
            "assets/train_hero.svg",
            width: 80,
          ),
        )
      ],
    );
  }
}
