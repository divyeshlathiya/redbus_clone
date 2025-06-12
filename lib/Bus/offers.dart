import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Offers",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times new roman",
                  )),
              Text("Get best deals with great offers")
            ],
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Colors.blueAccent.shade700))),
            child: Text(
              "View all",
              style: TextStyle(
                  color: Colors.blueAccent.shade700,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
        SizedBox(
          height: 240,
          child: PageView.builder(
            controller: _controller,
            padEnds: false,
            itemCount: 5,
            itemBuilder: (context, index) {
              return OfferCard(
                title: "Bus",
                subtitle: "Save upto Rs 500 with ICICI Netbanking",
                validDate: "31 Aug",
                offerCode: "ICICI500",
                img: "ICICI-Bank.png",
              );
            },
          ),
        )
      ],
    );
  }
}

class OfferCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String validDate;
  final String offerCode;
  final String img;
  const OfferCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.validDate,
      required this.offerCode,
      required this.img});

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/${widget.img}"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                width: 40,
                height: 20,
                child: Text(
                  "Bus",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )),
            Text(
              widget.subtitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Valid Till : ${widget.validDate}",
              style: TextStyle(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.local_offer_outlined),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.offerCode,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
