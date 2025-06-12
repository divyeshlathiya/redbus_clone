import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridTrainCard extends StatelessWidget {
  GridTrainCard({super.key});

  final List<String> _featureImg = [
    "ts.svg",
    "cp.svg",
    "food.svg",
    "madad.svg",
    "madad.svg",
  ];

  final List<String> _featureTitle = [
    "Train Schedule",
    "Coach Position",
    "Order food",
    "Rail Madad",
    "Rail Madad",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.spaceAround,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(_featureTitle.length, (index) {
            return TrainFeatureContainer(
              img: _featureImg[index],
              title: _featureTitle[index],
            );
          }),
        ),
      ),
    );
  }
}

class TrainFeatureContainer extends StatelessWidget {
  final String img;
  final String title;

  const TrainFeatureContainer({
    super.key,
    required this.img,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/$img",
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
