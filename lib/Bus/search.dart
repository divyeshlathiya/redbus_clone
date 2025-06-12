import 'package:flutter/material.dart';

class SearchPlace extends SearchDelegate {
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
        // Navigator.pop(context);
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
          title: Text(srchCity[index]),
          leading: Icon(Icons.location_city),
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
          title: Text(suggestedCity[index]),
          leading: Icon(Icons.location_city),
          onTap: () {
            query = suggestedCity[index];
            showResults(context);
          },
        );
      },
    );
  }
}
