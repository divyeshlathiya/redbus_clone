// import 'package:flutter/material.dart';

// class WhyBookRedRailContainer extends StatelessWidget {
//   WhyBookRedRailContainer({super.key});

//   final List<String> _title = [
//     "Redrail Confirm",
//     "Seat Guarantee",
//     "Connecting Trians"
//   ];

//   final List<String> _subtitle = [
//     "Confirm ticket on waitlisted trains",
//     "on waitlisted tickets or 3X refund",
//     "Connecting trains option available"
//   ];

//   final List<String> _img = [
//     "redRail_confirm.png",
//     "seat_guarantee.png",
//     "connecting_train.png"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Why Book With redRail",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           ...List.generate(_title.length, (index) {
//             return Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           _title[index],
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                         Text(_subtitle[index]),
//                       ],
//                     ),
//                     Image.asset(
//                       _img[index],
//                       width: 50,
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';

class WhyBookRedRailContainer extends StatefulWidget {
  const WhyBookRedRailContainer({super.key});

  @override
  State<WhyBookRedRailContainer> createState() =>
      _WhyBookRedRailContainerState();
}

class _WhyBookRedRailContainerState extends State<WhyBookRedRailContainer> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<String> _title = [
    "Seat Guarantee",
    "Redrail Confirm",
    "Connecting Trains"
  ];

  final List<String> _subtitle = [
    "on waitlisted tickets or 3X refund",
    "Confirm ticket on waitlisted trains",
    "Connecting trains option available"
  ];

  final List<String> _img = [
    "assets/seat_guarantee.png",
    "assets/redRail_confirm.png",
    "assets/connecting_train.png"
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentIndex < _title.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildMainCard(int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_title[index],
                      style: const TextStyle(fontSize: 18, color: Colors.blue)),
                  const SizedBox(height: 8),
                  Text(_subtitle[index], style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Image.asset(_img[index], width: 80, height: 80, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }

  // Widget _buildThumbnail(int index) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 6),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(10),
  //       child: Image.asset(
  //         _img[index],
  //         width: 50,
  //         height: 50,
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  Widget _clickKnowMoreBtn() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text(
          "Click to know more",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.local_activity),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen[50],
          iconColor: Colors.black,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final List<int> otherIndexes = List.generate(_title.length, (i) => i)
    //     .where((i) => i != _currentIndex)
    //     .toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Why Book With redRail",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            children: [
              // Left: Main auto-playing card
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 120,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _title.length,
                    itemBuilder: (context, index) {
                      return _buildMainCard(index);
                    },
                    physics:
                        const NeverScrollableScrollPhysics(), // prevent manual swipe
                  ),
                ),
              ),
            ],
          ),
          _clickKnowMoreBtn()
        ],
      ),
    );
  }
}
