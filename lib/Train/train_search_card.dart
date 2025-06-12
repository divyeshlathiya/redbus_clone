import 'package:flutter/material.dart';
import 'package:redbus_app/Train/train_search.dart';

class TrainSearchCard extends StatefulWidget {
  const TrainSearchCard({super.key});

  @override
  State<TrainSearchCard> createState() => _TrainSearchCardState();
}

class _TrainSearchCardState extends State<TrainSearchCard> {
  String _fromStation = "";
  String _toStation = "";
  DateTime? _selectedDateTime;

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050),
        initialDate: DateTime.now());

    if (pickedDate != null) {
      setState(() {
        _selectedDateTime = pickedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(width: 1, color: Colors.greenAccent)),
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  final result = await showSearch(
                      context: context, delegate: TrainSearch());

                  if (result != null && result.isNotEmpty) {
                    setState(() {
                      _fromStation = result;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.train_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        _fromStation.isEmpty ? "From" : _fromStation,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  final result = await showSearch(
                      context: context, delegate: TrainSearch());

                  if (result != null && result.isNotEmpty) {
                    setState(() {
                      _toStation = result;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(Icons.train_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        _toStation.isEmpty ? "To" : _toStation,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () => _selectDate(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Date of Journey:",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 10),
                            Text(
                              _selectedDateTime != null
                                  ? "${_selectedDateTime!.day}/${_selectedDateTime!.month}/${_selectedDateTime!.year}"
                                  : "Select Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedDateTime = DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day + 1);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        const Color.fromARGB(255, 52, 39, 39)),
                                child: Text("Tomorrow")),
                            SizedBox(
                              width: 8,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedDateTime = DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day + 2);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        const Color.fromARGB(255, 52, 39, 39)),
                                child: Text("Day After one")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
