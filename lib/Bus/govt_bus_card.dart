import 'package:flutter/material.dart';

class GovtBusesCard extends StatefulWidget {
  const GovtBusesCard({super.key});

  @override
  State<GovtBusesCard> createState() => GovtBusesCardState();
}

class GovtBusesCardState extends State<GovtBusesCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              debugPrint("Card $index Clicked!");
            },
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(8),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16, left: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/gsrtc.jpeg"),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "GSRTC",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    padding: const EdgeInsets.all(2),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "3.85",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "Gujarat State Road Transport Service",
                                style: TextStyle(fontSize: 11),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: double.infinity, child: Divider()),
                    Text(
                      textAlign: TextAlign.center,
                      "1500 services including Pavan, Babaraj, Patel and more",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Official booking partner of GSRTC",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      child: const Text(
                        "Use Code GSRTC to save upto 100 rs (Only for first time Users)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}