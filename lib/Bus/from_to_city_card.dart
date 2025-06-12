import 'package:flutter/material.dart';
import 'package:redbus_app/Bus/search.dart';

class FromToCityCardUI extends StatefulWidget {
  const FromToCityCardUI({super.key});

  @override
  State<FromToCityCardUI> createState() => _FromToCityCardUIState();
}

class _FromToCityCardUIState extends State<FromToCityCardUI> {
  String _fromCity = "";
  String _toCity = "";
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
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(width: 1, color: Colors.greenAccent)),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                final result = await showSearch(
                  context: context,
                  delegate: SearchPlace(),
                );
                if (result != null && result.isNotEmpty) {
                  setState(() {
                    _fromCity = result;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.black),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _fromCity.isEmpty ? "From" : _fromCity,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
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
                  context: context,
                  delegate: SearchPlace(),
                );
                if (result != null && result.isNotEmpty) {
                  setState(() {
                    _toCity = result;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.black),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _toCity.isEmpty ? "To" : _toCity,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // InkWell(
          //   child: TextField(
          //       controller: _toCity,
          //       decoration: InputDecoration(
          //           border: InputBorder.none,
          //           contentPadding: EdgeInsets.all(15),
          //           hintText: "To",
          //           prefixIcon: Icon(Icons.location_on_outlined)),
          //       readOnly: true,
          //       onTap: () async {
          //         final result = await showSearch(
          //             context: context, delegate: SearchPlace());
          //         if (result != null && result.isNotEmpty) {
          //           _toCity.text = result;
          //         }
          //       }),
          // ),
          Divider(),
          InkWell(
            onTap: () => _selectDate(context),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                                _selectedDateTime = DateTime.now();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromARGB(255, 52, 39, 39)),
                            child: Text("Today"),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  int day =
                                      DateTime.now().day; // Fetch today date
                                  day = day + 1;
                                  _selectedDateTime = DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      day);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      const Color.fromARGB(255, 52, 39, 39)),
                              child: Text("Tomorrow"))
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
    );
  }
}
