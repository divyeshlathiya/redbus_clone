import 'package:flutter/material.dart';

class TrainSearch extends SearchDelegate {
  final List<String> _cities = [
    "Surat",
    "Ahmedabad",
    "Mumbai",
    "Vadodara",
    "Pune",
    "Rajkot",
    "Junagadh",
    "Amreli",
    "Bhavanagar"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: query.isNotEmpty ? Icon(Icons.close) : Icon(null))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(Icons.arrow_back),
      color: Colors.black,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final srchCity = _cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: srchCity.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("${srchCity[index]} Jn"),
          subtitle: Text(srchCity[index]),
          onTap: () {
            close(context, srchCity[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestedCity = _cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestedCity.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "${suggestedCity[index]} Jn",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(suggestedCity[index]),
          onTap: () {
            query = suggestedCity[index];
            showResults(context);
          },
        );
      },
    );
  }
}
